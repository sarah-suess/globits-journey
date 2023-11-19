#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "gamespritesheet.h"
#include "newgametilemap.h"
#include "newgametilemap2.h"
#include "newgametileset.h"
#include "newcollisionmap.h"
#include "newcollisionmap2.h"
#include "newtileset.h"
#include "newTilemap.h"
#include "newgamespritesheet.h"
#include "cloudmap.h"
#include "sound.h"
#include "gameMusic.h"
#include "jumpSound.h"

#define MAPWIDTH 512
#define MAPHEIGHT 256

// How to play: from the start press start to play and A for instructions
// Then from instructions you can press left to go to start and right to play the game
// In the game, it is left and right to move and up to jump. Can also double jump.
// If you collect the golden apple, you can fly by pressing up quickly. 
// To collect the wand, press A while on top of it. Then can shoot using the B button. Colliding with an enemy resets the game.
// To pause, while in the game state press start.
// While in the pause state, press start to resume game and select to go to start screen.
// Currently, you win by reaching the edge of the 2 maps and you must collect all the fruit to advance through maps. 
// In win state you can press start to go to start screen.
// If you lose all your lives, you enter the lose state and can return to the start screen by pressing start.

void initialize();

OBJ_ATTR shadowOAM[128];

void initialize();
void goToStart();
void goToInstructions();
void goToGame();
void goToPause();
void goToLose();
void pauseToGame();
void draw();
void update();
void initializePlayer();
void initializeEnemy();
void initwand();
void initfruit();
void initializeLives();
void resetPlayer();
void updatePlayer();
void updateEnemy();
void updatewand();
void updateBullet();
void updateFruit();
void loseLife();
void initCheat();
void updateCheat();
void initfruit2();
void updateFruit2();

unsigned short oldButtons;
unsigned short buttons;

typedef enum {START, INSTRUCTIONS, GAME, GAME2, PAUSE, WIN, LOSE} STATE;

unsigned char* collisionMap;

SPRITE player;
WEAPON wand;
WEAPON bullet;
SPRITE enemy[3];
SPRITE life[3];
SPRITE fruit;
SPRITE cheat;
SPRITE fruit2[2];

int time;
int jumpStart;
int state;
int hOff;
int vOff;
int game;

// goes with bg 1 
int hOff2;
int vOff2;
int sbb;

int main() {
    mgba_open();
    goToStart();
    time = 0;
    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        switch (state) {
            case START:
                //mgba_printf("start state");
                stopSounds();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToGame();
                    playSoundA(gameMusic_data, gameMusic_length, 1);
                }
                if (BUTTON_PRESSED(BUTTON_A)) {
                    state = INSTRUCTIONS;
                }
                REG_BG2HOFF = 0;
                REG_BG2VOFF = 0;
                break;
            case INSTRUCTIONS:
                //mgba_printf("inst state");
                stopSounds();
                if (BUTTON_PRESSED(BUTTON_LEFT)) {
                    goToStart();
                }
                if (BUTTON_PRESSED(BUTTON_RIGHT)) {
                    goToGame();
                    playSoundA(gameMusic_data, gameMusic_length, 1);
                }
                REG_BG2HOFF = 240;
                REG_BG2VOFF = 0;
                break;
            case GAME:
                //mgba_printf("game state");
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToPause();
                }
                if (player.lives == 0) {
                    goToLose();
                }
                update();
                waitForVBlank();
                draw();
                break;
            case GAME2:
                //mgba_printf("game2 state");
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToPause();
                }
                if (player.lives == 0) {
                    goToLose();
                }
                update();
                waitForVBlank();
                draw();
                break;
            case PAUSE:
                //mgba_printf("pause state");
                stopSounds();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    playSoundA(gameMusic_data, gameMusic_length, 1);
                    pauseToGame();
                }
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToStart();
                }
                REG_BG2HOFF = 0;
                REG_BG2VOFF = 160;
                break;
            case WIN:
                //mgba_printf("win state");
                stopSounds();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();
                }
                REG_BG2HOFF = 240;
                REG_BG2VOFF = 160;
                break;
            case LOSE:
                //mgba_printf("lose state");
                stopSounds();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();
                }
                REG_BG2HOFF = 0;
                REG_BG2VOFF = 320;
                break;
        }
        time++;
    }
}

// loads in my maps for start, instructions, and my win state + spritesheet
void initialize() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(2) | BG_DISABLE(0);
    REG_BG2CNT = 2 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE | BG_8BPP;

    DMANow(3, newtilesetTiles, &CHARBLOCK[0], sizeof(newtilesetTiles)/2);
    DMANow(3, newtilesetPal, PALETTE, sizeof(newtilesetPal)/2);

    DMANow(3, newTilemapMap, &SCREENBLOCK[24], newTilemapMapLen / 2);

    DMANow(3, newgamespritesheetTiles, &CHARBLOCK[4], newgamespritesheetTilesLen/2);
    DMANow(3, newgamespritesheetPal, SPRITEPALETTE, newgamespritesheetPalLen / 2);

    setupSounds();
    setupInterrupts();
}

// sets up start state
void goToStart() {
    initialize();
    state = START;
    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;
}

// loads in my game map and initializes my player, enemy, and wand
void goToGame() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(2) | BG_ENABLE(1) | SPRITE_ENABLE;
    hideSprites();
    state = GAME;
    REG_BG1CNT = 3 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(22) | BG_SIZE_WIDE | BG_8BPP;
    REG_BG2CNT = 2 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_WIDE | BG_8BPP;

    DMANow(3, newgametilesetTiles, &CHARBLOCK[0], sizeof(newgametilesetTiles)/2);
    DMANow(3, newgametilesetPal, PALETTE, sizeof(newgametilesetPal)/2);
    
    DMANow(3, cloudmapMap, &SCREENBLOCK[22], cloudmapMapLen/2);
    DMANow(3, newgametilemapMap, &SCREENBLOCK[24], newgametilemapMapLen/2);
    DMANow(3, newgametilemap2Map, &SCREENBLOCK[26], newgametilemapMapLen/2);

    DMANow(3, newgamespritesheetTiles, &CHARBLOCK[4], newgamespritesheetTilesLen/2);
    DMANow(3, newgamespritesheetPal, SPRITEPALETTE, newgamespritesheetPalLen / 2);

    collisionMap = (unsigned char*) newcollisionmapBitmap;

    initializePlayer();
    initializeEnemy();
    initwand();
    initializeLives();
    initfruit();
    initCheat();

    REG_BG2HOFF = 0;
    REG_BG2VOFF = 95;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 30;

    game = 1;
}

// sets up my second map
void goToGame2() {
    hideSprites();
    state = GAME2;
    REG_BG1CNT = 3 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(22) | BG_SIZE_WIDE | BG_8BPP;
    REG_BG2CNT = 2 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_WIDE | BG_8BPP;

    DMANow(3, newgametilesetTiles, &CHARBLOCK[0], sizeof(newgametilesetTiles)/2);
    DMANow(3, newgametilesetPal, PALETTE, sizeof(newgametilesetPal)/2);
    
    DMANow(3, cloudmapMap, &SCREENBLOCK[22], cloudmapMapLen/2);
    DMANow(3, newgametilemap2Map, &SCREENBLOCK[24], newgametilemapMapLen/2);

    collisionMap = (unsigned char*) newcollisionmap2Bitmap;

    hideSprites();

    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;

    // cloudmap
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 30;

    player.x = 5;
    player.y = 56;

    initializeEnemy();
    initfruit2();
    // hides golden apple
    shadowOAM[10].attr0 = ATTR0_HIDE;
    shadowOAM[2].attr0 = ATTR0_HIDE;
    cheat.active = 0;
    wand.active = 0;

    game = 2;
}

// resets the game when a player loses a life
void resetGame() {
    state = GAME;

    resetPlayer();
    initializeEnemy();
    initwand();
    initCheat();
    initfruit();
    player.fruit = 0;

    SCREENBLOCK[24].tilemap[OFFSET(2,25,32)] = TILEMAP_ENTRY_TILEID(133);
    SCREENBLOCK[24].tilemap[OFFSET(1,26,32)] = TILEMAP_ENTRY_TILEID(164);
    SCREENBLOCK[24].tilemap[OFFSET(2,26,32)] = TILEMAP_ENTRY_TILEID(165);        
    SCREENBLOCK[24].tilemap[OFFSET(3,26,32)] = TILEMAP_ENTRY_TILEID(166);
    SCREENBLOCK[24].tilemap[OFFSET(1,27,32)] = TILEMAP_ENTRY_TILEID(196);
    SCREENBLOCK[24].tilemap[OFFSET(2,27,32)] = TILEMAP_ENTRY_TILEID(197);
    SCREENBLOCK[24].tilemap[OFFSET(3,27,32)] = TILEMAP_ENTRY_TILEID(198);
}

void resetGame2() {
    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;

    // cloudmap
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 30;

    player.x = 5;
    player.y = 56;
    initializeEnemy();
    initfruit2();
    player.fruit = 1;
}

// used to resume gameplay without reinitializing the sprites or hoff/voff
void pauseToGame() {
    if (game == 1) {
        state = GAME;
        REG_DISPCTL = MODE(0) | BG_ENABLE(2) | BG_ENABLE(1) | SPRITE_ENABLE;
        hideSprites();
        REG_BG1CNT = 3 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(22) | BG_SIZE_WIDE | BG_8BPP;
        REG_BG2CNT = 2 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_WIDE | BG_8BPP;

        DMANow(3, newgametilesetTiles, &CHARBLOCK[0], sizeof(newgametilesetTiles)/2);
        DMANow(3, newgametilesetPal, PALETTE, sizeof(newgametilesetPal)/2);
        
        DMANow(3, cloudmapMap, &SCREENBLOCK[22], cloudmapMapLen/2);
        DMANow(3, newgametilemapMap, &SCREENBLOCK[24], newgametilemapMapLen/2);
        DMANow(3, newgametilemap2Map, &SCREENBLOCK[26], newgametilemapMapLen/2);

        collisionMap = (unsigned char*) newcollisionmapBitmap;
    } else if (game == 2) {
        state = GAME2;
        REG_DISPCTL = MODE(0) | BG_ENABLE(2) | BG_ENABLE(1) | SPRITE_ENABLE;
        hideSprites();
        REG_BG1CNT = 3 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(22) | BG_SIZE_WIDE | BG_8BPP;
        REG_BG2CNT = 2 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_WIDE | BG_8BPP;

        DMANow(3, newgametilesetTiles, &CHARBLOCK[0], sizeof(newgametilesetTiles)/2);
        DMANow(3, newgametilesetPal, PALETTE, sizeof(newgametilesetPal)/2);
        
        DMANow(3, cloudmapMap, &SCREENBLOCK[22], cloudmapMapLen/2);
        DMANow(3, newgametilemap2Map, &SCREENBLOCK[24], newgametilemapMapLen/2);

        collisionMap = (unsigned char*) newcollisionmap2Bitmap;
    }
}

// Changes the map for the pause state
void goToPause() {
    state = PAUSE;
    REG_DISPCTL = MODE(0) | BG_ENABLE(2) | BG_DISABLE(0);
    REG_BG2CNT = 2 | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE | BG_8BPP;

    DMANow(3, newtilesetTiles, &CHARBLOCK[0], sizeof(newtilesetTiles)/2);
    DMANow(3, newtilesetPal, PALETTE, sizeof(newtilesetPal)/2);

    DMANow(3, newTilemapMap, &SCREENBLOCK[24], newTilemapMapLen / 2);

    DMANow(3, newgamespritesheetTiles, &CHARBLOCK[4], newgamespritesheetTilesLen/2);
    DMANow(3, newgamespritesheetPal, SPRITEPALETTE, newgamespritesheetPalLen / 2);

    REG_BG2HOFF = 0;
    REG_BG2VOFF = 160;
}

void goToLose() {
    initialize();
    state = LOSE;
}

inline unsigned char colorAt(int x, int y){
    return collisionMap[OFFSET(x, y, MAPWIDTH)];
}

// Initializes the player
void initializePlayer() {
    player.width = 8;
    player.height = 8;
    player.x = 65;
    player.y = 216;
    player.jumping = 0;
    player.doublej = 0;
    player.wand = 0;
    player.left = 0;
    player.right = 0;
    player.lives = 3;
    player.onGround = 2;
    player.cheat = 0;
}

// Does not reset the player lives
void resetPlayer() {
    player.width = 8;
    player.height = 8;
    player.x = 65;
    player.y = 216;
    player.jumping = 0;
    player.doublej = 0;
    player.wand = 0;
    player.left = 0;
    player.right = 0;
    player.fruit = 0;
    player.cheat = 0;
}

// Initializes the wand
void initwand() {
    wand.x = 80;
    wand.y = 216;
    wand.width = 2;
    wand.height = 8;
    wand.active = 1;
}

// Initalizes the fruit
void initfruit() {
    fruit.x = 360;
    fruit.y = 71;
    fruit.width = 6;
    fruit.height = 10;
    fruit.active = 1;
}

// initalizes fruit for second map
void initfruit2() {
    for (int i = 0; i < 2; i++) {
        fruit2[i].width = 6;
        fruit2[i].height = 10;
        fruit2[i].active = 1;
    }
    fruit2[0].x = 344;
    fruit2[0].y = 56;
    fruit2[1].x = 440;
    fruit2[1].y = 192;
}

void initCheat() {
    cheat.x = 25;
    cheat.y = 207;
    cheat.width = 6;
    cheat.height = 10;
    cheat.active = 1;
}

// Initializes the bullet
void initBullet() {
    bullet.x = player.x;
    bullet.y = player.y + 3;
    bullet.width = 2;
    bullet.height = 2;
    bullet.active = 1;
}

// Initializes the enemy
void initializeEnemy() {
    for (int i = 0; i < 3; i++) {
        enemy[i].width = 7;
        enemy[i].height = 13;
        enemy[i].active = 1;
        enemy[i].left = 1;
        enemy[i].right = 0;
    }
    if (state == GAME) {
        enemy[0].x = 145;
        enemy[0].y = 170;

        enemy[1].x = 398;
        enemy[1].y = 50;

        enemy[2].x = 340;
        enemy[2].y = 122;
    } else if (state == GAME2) {
        enemy[0].x = 190;
        enemy[0].y = 194;

        enemy[1].x = 261;
        enemy[1].y = 82;

        enemy[2].x = 358;
        enemy[2].y = 234;
    }
    enemy[0].time = 10;
    enemy[1].time = 20;
    enemy[2].time = 25;
    
}

// shadow oam 4, 5, 6
void initializeLives() {
    for (int i = 0; i < 3; i++) {
        life[i].width = 5;
        life[i].height = 5;
        life[i].x = 204+(11*i);
        life[i].y = 6;
        life[i].active = 1;
    }
}

// updates the game state
void update() {
    updatePlayer();
    for (int i = 0; i < 3; i++) {
        updateEnemy(&enemy[i]);
    }
    updatewand();
    updateBullet();
    updateFruit();
    updateCheat();

    if (state == GAME2) {
        updateFruit2();
        for (int i = 0; i < 2; i++) {
            updateFruit2(&fruit2[i]);
        }
    }
    
    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT- SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    hOff2 = ((player.x) - (SCREENWIDTH - player.width) / 2) / 3;
    if (hOff2 < 0) hOff2 = 0;
    if (hOff2 > MAPWIDTH - SCREENWIDTH) hOff2 = MAPWIDTH - SCREENWIDTH;
}

// updates the player
void updatePlayer() {
    //mgba_printf("%d player.x, %d player.y", player.x, player.y);
    // moves the player
    if (BUTTON_HELD(BUTTON_RIGHT) && (colorAt(player.x + 8, player.y)) && (colorAt(player.x + 8, player.y + player.height - 1))) {
        if (player.fruit) {
            player.x++;
            player.right = 1;   
        } else if (!player.fruit && player.x < 511) {
            player.x++;
            player.right = 1;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT) && (colorAt(player.x - 1, player.y)) && (colorAt(player.x - 1, player.y + player.height - 1)) && player.x > 0) {
        player.x--;
        player.left = 1;
    }
    // used to jump and can also double jump
    if (BUTTON_PRESSED(BUTTON_UP) && (colorAt(player.x, player.y - 1)) && player.onGround > 0) {

        if (player.jumping) {
            playSoundB(jumpSound_data, jumpSound_length, 0);
            player.doublej = 1;
            if (!player.cheat) {
                player.onGround--;
            }
        } else if (!player.jumping) {
            playSoundB(jumpSound_data, jumpSound_length, 0);
            if (!player.cheat) {
                player.onGround--;
            }
            player.jumping = 1;
            jumpStart = time;
        }
    }
    
    // current way to double jump. currently "stacks" jumps
    if (player.jumping) {
        if (player.doublej) {
            jumpStart = time;
            player.doublej = 0;
        }
        if ((time - jumpStart) > 13) {
            player.jumping = 0;
        } else {
            if (colorAt(player.x, player.y - 1) && colorAt(player.x + 7, player.y - 1)) {
                player.y--;
            }
        }
    } else {
        // current way to implement gravity
        if (colorAt(player.x, player.y + 9) && (colorAt(player.x + player.width - 1, player.y + 9))) {
            player.y += 2;
        }
        if (colorAt(player.x, player.y + 8) && (colorAt(player.x + player.width - 1, player.y + 8))) {
            player.y += 1;
        }
    }

    if (!colorAt(player.x, player.y + 8) | (!colorAt(player.x + player.width - 1, player.y + 8))) {
        //mgba_printf("on ground");
        player.onGround = 2;
    }
    if (!colorAt(player.x, player.y + 9) | (!colorAt(player.x + player.width - 1, player.y + 9))) {
        player.onGround = 2;
    }
    if (!colorAt(player.x + 4, player.y + 8) | (!colorAt(player.x + player.width - 1, player.y + 8))) {
        //mgba_printf("on ground");
        player.onGround = 2;
    }
    if (!colorAt(player.x + 4, player.y + 9) | (!colorAt(player.x + player.width - 1, player.y + 9))) {
        player.onGround = 2;
    }

    // player falls
    if (player.y >= 245) {
        loseLife();
        if (state == GAME) {
            resetGame();
        } else if (state == GAME2) {
            resetGame2();
        }
    }

    // if the player has picked up the wand they can fire
    if (player.wand && BUTTON_PRESSED(BUTTON_B)) {
        initBullet();
    } 

    //end of map
    if (state == GAME) {
        if ((player.x + player.width - 1 >= 511) && (player.fruit)) {
            goToGame2();
            state = GAME2;
        }
    } else if (state == GAME2) {
        if (player.x + player.width - 1 >= 511 && player.fruit >= 3) {
            initialize();
            state = WIN;
        }
    }

    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
    shadowOAM[0].attr1 = ATTR1_TINY | ATTR1_X(player.x - hOff);

    // animates my player based off its current movement. 
    if (player.jumping) {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 2) | ATTR2_PRIORITY(0);
    } else if (player.left) {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 2) | ATTR2_PRIORITY(0);
        player.left = 0;
    } else if (player.right) {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 2) | ATTR2_PRIORITY(0);
        player.right = 0;
    } else {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 2) | ATTR2_PRIORITY(0);
    }

    //mgba_printf("%d player fruit", player.fruit);
}

// 7 8 9 in oam
// updates the enemy
void updateEnemy(SPRITE* e) {
        if (e->active) {
            if (time % 4 == 0) {
                if (e->left) {
                    if (colorAt(e->x + 1, e->y + e->height + 1)) {
                        e->left = 0;
                        e->right = 1;
                    } else {
                        e->x--;
                    }
                }
                if (e->right) {
                    if (colorAt(e->x + e-> width + 1, e->y + e->height + 1) || !colorAt(e->x + e-> width - 1, e->y + e->height - 3)) {
                        e->left = 1;
                        e->right = 0;
                    } else {
                        e->x++;
                    }
                }
            }

            // resets game if collision with enemy. would also lose a life
            if (collision(player.x, player.y, player.width, player.height, e->x, e->y, e->width, e->height)) {
                loseLife();
                if (state == GAME) {
                    resetGame();
                } else if (state == GAME2) {
                    resetGame2();
                }
            }

            if (bullet.active) {
                if (collision(bullet.x, bullet.y, bullet.width, bullet.height, e->x, e->y, e->width, e->height)) {
                    bullet.active = 0;
                    e->active = 0;
                    shadowOAM[3].attr0 = ATTR0_HIDE;
                }
            }
        }
}

// updates the wand
void updatewand() {
    if (wand.active) {
        shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(wand.y - vOff);
        shadowOAM[2].attr1 = ATTR1_TINY | ATTR1_X(wand.x - hOff);
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 0) | ATTR2_PRIORITY(0);
    }

    // if the player is touching the wand, they can pick it up
    if (collision(player.x, player.y, player.width, player.height, wand.x, wand.y, wand.width, wand.height) && (BUTTON_PRESSED(BUTTON_A))) {
        shadowOAM[2].attr0 = ATTR0_HIDE;
        wand.active = 0;
        player.wand = 1;
    }

}

// updates the bullet
void updateBullet() {
    if (bullet.active) {
        bullet.x += 2;
        shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(bullet.y - vOff);
        shadowOAM[3].attr1 = ATTR1_TINY | ATTR1_X(bullet.x - hOff);
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 1) | ATTR2_PRIORITY(0);
    }

    // prevents bullet from wrapping
    if (bullet.x >= 511) {
        bullet.active = 0;
        shadowOAM[3].attr0 = ATTR0_HIDE;
    }
}

void updateFruit() {
    if (fruit.active) {
        shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(fruit.y - vOff);
        shadowOAM[1].attr1 = ATTR1_TINY | ATTR1_X(fruit.x - hOff);
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 3) | ATTR2_PRIORITY(0);
    }

    // if the player is on top of the fruit, they can collect it by pressing A
    if (collision(player.x, player.y, player.width, player.height, fruit.x, fruit.y, fruit.width, fruit.height) && (BUTTON_PRESSED(BUTTON_A))) {
        shadowOAM[1].attr0 = ATTR0_HIDE;
        fruit.active = 0;
        player.fruit++;
    }
}

void updateFruit2(SPRITE* e) {
    if (e->active) {
        if (collision(player.x, player.y, player.width, player.height, e->x, e->y, e->width, e->height) && (BUTTON_PRESSED(BUTTON_A))) {
            e->active = 0;
            player.fruit++;
        }
    }
}

void updateCheat() {
    if (cheat.active) {
        shadowOAM[10].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(cheat.y - vOff);
        shadowOAM[10].attr1 = ATTR1_TINY | ATTR1_X(cheat.x - hOff);
        shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 3) | ATTR2_PRIORITY(0);
    }

    if (collision(player.x, player.y, player.width, player.height, cheat.x, cheat.y, cheat.width, cheat.height) && (BUTTON_PRESSED(BUTTON_A))) {
        shadowOAM[10].attr0 = ATTR0_HIDE;
        cheat.active = 0;
        player.cheat = 1;
        SCREENBLOCK[24].tilemap[OFFSET(2,25,32)] = TILEMAP_ENTRY_TILEID(6);
        SCREENBLOCK[24].tilemap[OFFSET(1,26,32)] = TILEMAP_ENTRY_TILEID(6);
        SCREENBLOCK[24].tilemap[OFFSET(2,26,32)] = TILEMAP_ENTRY_TILEID(6);
        SCREENBLOCK[24].tilemap[OFFSET(3,26,32)] = TILEMAP_ENTRY_TILEID(6);
        SCREENBLOCK[24].tilemap[OFFSET(1,27,32)] = TILEMAP_ENTRY_TILEID(6);
        SCREENBLOCK[24].tilemap[OFFSET(2,27,32)] = TILEMAP_ENTRY_TILEID(6);
        SCREENBLOCK[24].tilemap[OFFSET(3,27,32)] = TILEMAP_ENTRY_TILEID(6);
    }
}

// 4 5 6 in oam
void loseLife() {
    if (player.lives == 3) {
        life[0].active = 0;
        player.lives--;
        shadowOAM[4].attr0 = ATTR0_HIDE;
    } else if (player.lives == 2) {
        SPRITEPALETTE[18] = RED;
        player.lives--;
        life[1].active = 0;
        shadowOAM[5].attr0 = ATTR0_HIDE;
    } else if (player.lives == 1) {
        player.lives--;
    }
}

// Draws the lives on the screen
void drawLives() {
    for (int i = 0; i < 3; i++) {
        if (life[i].active) {
            shadowOAM[i+4].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(life[i].y);
            shadowOAM[i+4].attr1 = ATTR1_TINY | ATTR1_X(life[i].x);
            shadowOAM[i+4].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(7, 2);
        }
    }
}

// draws and animates the enemies
void drawEnemy() {
    for (int i = 0; i < 3; i++) {
        if (enemy[i].active) {
                if (enemy[i].time >= 0 && enemy[i].time < 30) {
                    shadowOAM[i + 7].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(enemy[i].y - vOff);
                    shadowOAM[i + 7].attr1 = ATTR1_TINY | ATTR1_X(enemy[i].x - hOff);
                    shadowOAM[i + 7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 2) | ATTR2_PRIORITY(0);
                    enemy[i].time++;
                } else if (enemy[i].time >= 30 && enemy[i].time < 60) {
                    shadowOAM[i + 7].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(enemy[i].y - vOff);
                    shadowOAM[i + 7].attr1 = ATTR1_TINY | ATTR1_X(enemy[i].x - hOff);
                    shadowOAM[i + 7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 2) | ATTR2_PRIORITY(0);
                    enemy[i].time++;
                } else if (enemy[i].time >= 60 && enemy[i].time < 90) {
                    shadowOAM[i + 7].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(enemy[i].y - vOff);
                    shadowOAM[i + 7].attr1 = ATTR1_TINY | ATTR1_X(enemy[i].x - hOff);
                    shadowOAM[i + 7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 2) | ATTR2_PRIORITY(0);
                    enemy[i].time++;
                } else if (enemy[i].time >= 90 && enemy[i].time < 119) {
                    shadowOAM[i + 7].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(enemy[i].y - vOff);
                    shadowOAM[i + 7].attr1 = ATTR1_TINY | ATTR1_X(enemy[i].x - hOff);
                    shadowOAM[i + 7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 2) | ATTR2_PRIORITY(0);
                    enemy[i].time++;
                } else {
                    enemy[i].time = 0;
                }
        } else {
            shadowOAM[i + 7].attr0 = ATTR0_HIDE;
        }
    }
}

// SHADOW OAM 11 AND 12
void drawFruit2() {
    for (int i = 0; i < 2; i++) {
        if (fruit2[i].active && (state == GAME2)) {
            if (i == 0) {
                shadowOAM[11].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(fruit2[i].y - vOff);
                shadowOAM[11].attr1 = ATTR1_TINY | ATTR1_X(fruit2[i].x - hOff);
                shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 3) | ATTR2_PRIORITY(0);
            } else if (i == 1) {
                shadowOAM[12].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(fruit2[i].y - vOff);
                shadowOAM[12].attr1 = ATTR1_TINY | ATTR1_X(fruit2[i].x - hOff);
                shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 3) | ATTR2_PRIORITY(0);
            }
        } else {
            shadowOAM[i + 11].attr0 = ATTR0_HIDE;
        }
    }
}

void draw() {
    REG_BG2HOFF = hOff;
    REG_BG2VOFF = vOff;

    REG_BG1HOFF = hOff2;
    REG_BG1VOFF = vOff2;
    drawLives();
    drawEnemy();
    drawFruit2();

    DMANow(3, shadowOAM, OAM, 128*4);
}
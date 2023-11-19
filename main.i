# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);
# 23 "gba.h"
extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
void waitForVBlank();
void flipPage();
void drawFullscreenImage4(const unsigned short *image);
# 63 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 79 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 111 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 4 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int width;
    int height;
    int active;
    int hide;
    int jumping;
    int doublej;
    int left;
    int right;
    int wand;
    int lives;
    int time;
    int fruit;
    int onGround;
    int cheat;
} SPRITE;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int active;
    int hide;
} WEAPON;
# 5 "main.c" 2
# 1 "gamespritesheet.h" 1
# 21 "gamespritesheet.h"
extern const unsigned short gamespritesheetTiles[16384];


extern const unsigned short gamespritesheetPal[256];
# 6 "main.c" 2
# 1 "newgametilemap.h" 1







extern const unsigned short newgametilemapMap[2048];
# 7 "main.c" 2
# 1 "newgametilemap2.h" 1







extern const unsigned short newgametilemap2Map[2048];
# 8 "main.c" 2
# 1 "newgametileset.h" 1
# 21 "newgametileset.h"
extern const unsigned short newgametilesetTiles[32768];


extern const unsigned short newgametilesetPal[256];
# 9 "main.c" 2
# 1 "newcollisionmap.h" 1
# 21 "newcollisionmap.h"
extern const unsigned short newcollisionmapBitmap[65536];


extern const unsigned short newcollisionmapPal[256];
# 10 "main.c" 2
# 1 "newcollisionmap2.h" 1
# 21 "newcollisionmap2.h"
extern const unsigned short newcollisionmap2Bitmap[65536];


extern const unsigned short newcollisionmap2Pal[256];
# 11 "main.c" 2
# 1 "newtileset.h" 1
# 21 "newtileset.h"
extern const unsigned short newtilesetTiles[32768];


extern const unsigned short newtilesetPal[256];
# 12 "main.c" 2
# 1 "newTilemap.h" 1







extern const unsigned short newTilemapMap[4096];
# 13 "main.c" 2
# 1 "newgamespritesheet.h" 1
# 21 "newgamespritesheet.h"
extern const unsigned short newgamespritesheetTiles[16384];


extern const unsigned short newgamespritesheetPal[256];
# 14 "main.c" 2
# 1 "cloudmap.h" 1







extern const unsigned short cloudmapMap[2048];
# 15 "main.c" 2
# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
void setupInterrupts();
void interruptHandler();
# 51 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 16 "main.c" 2
# 1 "gameMusic.h" 1


extern const unsigned int gameMusic_sampleRate;
extern const unsigned int gameMusic_length;
extern const signed char gameMusic_data[];
# 17 "main.c" 2
# 1 "jumpSound.h" 1


extern const unsigned int jumpSound_sampleRate;
extern const unsigned int jumpSound_length;
extern const signed char jumpSound_data[];
# 18 "main.c" 2
# 33 "main.c"
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


int hOff2;
int vOff2;
int sbb;

int main() {
    mgba_open();
    goToStart();
    time = 0;
    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        switch (state) {
            case START:

                stopSounds();
                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
                    goToGame();
                    playSoundA(gameMusic_data, gameMusic_length, 1);
                }
                if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
                    state = INSTRUCTIONS;
                }
                (*(volatile unsigned short *)0x04000018) = 0;
                (*(volatile unsigned short *)0x0400001A) = 0;
                break;
            case INSTRUCTIONS:

                stopSounds();
                if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5))))) {
                    goToStart();
                }
                if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4))))) {
                    goToGame();
                    playSoundA(gameMusic_data, gameMusic_length, 1);
                }
                (*(volatile unsigned short *)0x04000018) = 240;
                (*(volatile unsigned short *)0x0400001A) = 0;
                break;
            case GAME:

                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
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

                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
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

                stopSounds();
                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
                    playSoundA(gameMusic_data, gameMusic_length, 1);
                    pauseToGame();
                }
                if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
                    goToStart();
                }
                (*(volatile unsigned short *)0x04000018) = 0;
                (*(volatile unsigned short *)0x0400001A) = 160;
                break;
            case WIN:

                stopSounds();
                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
                    goToStart();
                }
                (*(volatile unsigned short *)0x04000018) = 240;
                (*(volatile unsigned short *)0x0400001A) = 160;
                break;
            case LOSE:

                stopSounds();
                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
                    goToStart();
                }
                (*(volatile unsigned short *)0x04000018) = 0;
                (*(volatile unsigned short *)0x0400001A) = 320;
                break;
        }
        time++;
    }
}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (2 % 4))) | (0 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x400000C) = 2 | ((0) << 2) | ((24) << 8) | (3 << 14) | (1 << 7);

    DMANow(3, newtilesetTiles, &((charblock *)0x06000000)[0], sizeof(newtilesetTiles)/2);
    DMANow(3, newtilesetPal, ((unsigned short *)0x5000000), sizeof(newtilesetPal)/2);

    DMANow(3, newTilemapMap, &((screenblock *)0x6000000)[24], (8192) / 2);

    DMANow(3, newgamespritesheetTiles, &((charblock *)0x06000000)[4], 32768/2);
    DMANow(3, newgamespritesheetPal, ((u16 *)0x5000200), 512 / 2);

    setupSounds();
    setupInterrupts();
}


void goToStart() {
    initialize();
    state = START;
    (*(volatile unsigned short *)0x04000018) = 0;
    (*(volatile unsigned short *)0x0400001A) = 0;
}


void goToGame() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (2 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);
    hideSprites();
    state = GAME;
    (*(volatile unsigned short*)0x400000A) = 3 | ((0) << 2) | ((22) << 8) | (1 << 14) | (1 << 7);
    (*(volatile unsigned short*)0x400000C) = 2 | ((0) << 2) | ((24) << 8) | (1 << 14) | (1 << 7);

    DMANow(3, newgametilesetTiles, &((charblock *)0x06000000)[0], sizeof(newgametilesetTiles)/2);
    DMANow(3, newgametilesetPal, ((unsigned short *)0x5000000), sizeof(newgametilesetPal)/2);

    DMANow(3, cloudmapMap, &((screenblock *)0x6000000)[22], (4096)/2);
    DMANow(3, newgametilemapMap, &((screenblock *)0x6000000)[24], (4096)/2);
    DMANow(3, newgametilemap2Map, &((screenblock *)0x6000000)[26], (4096)/2);

    DMANow(3, newgamespritesheetTiles, &((charblock *)0x06000000)[4], 32768/2);
    DMANow(3, newgamespritesheetPal, ((u16 *)0x5000200), 512 / 2);

    collisionMap = (unsigned char*) newcollisionmapBitmap;

    initializePlayer();
    initializeEnemy();
    initwand();
    initializeLives();
    initfruit();
    initCheat();

    (*(volatile unsigned short *)0x04000018) = 0;
    (*(volatile unsigned short *)0x0400001A) = 95;

    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 30;

    game = 1;
}


void goToGame2() {
    hideSprites();
    state = GAME2;
    (*(volatile unsigned short*)0x400000A) = 3 | ((0) << 2) | ((22) << 8) | (1 << 14) | (1 << 7);
    (*(volatile unsigned short*)0x400000C) = 2 | ((0) << 2) | ((24) << 8) | (1 << 14) | (1 << 7);

    DMANow(3, newgametilesetTiles, &((charblock *)0x06000000)[0], sizeof(newgametilesetTiles)/2);
    DMANow(3, newgametilesetPal, ((unsigned short *)0x5000000), sizeof(newgametilesetPal)/2);

    DMANow(3, cloudmapMap, &((screenblock *)0x6000000)[22], (4096)/2);
    DMANow(3, newgametilemap2Map, &((screenblock *)0x6000000)[24], (4096)/2);

    collisionMap = (unsigned char*) newcollisionmap2Bitmap;

    hideSprites();

    (*(volatile unsigned short *)0x04000018) = 0;
    (*(volatile unsigned short *)0x0400001A) = 0;


    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 30;

    player.x = 5;
    player.y = 56;

    initializeEnemy();
    initfruit2();

    shadowOAM[10].attr0 = (2<<8);
    shadowOAM[2].attr0 = (2<<8);
    cheat.active = 0;
    wand.active = 0;

    game = 2;
}


void resetGame() {
    state = GAME;

    resetPlayer();
    initializeEnemy();
    initwand();
    initCheat();
    initfruit();
    player.fruit = 0;

    ((screenblock *)0x6000000)[24].tilemap[((25) * (32) + (2))] = (133 % 512);
    ((screenblock *)0x6000000)[24].tilemap[((26) * (32) + (1))] = (164 % 512);
    ((screenblock *)0x6000000)[24].tilemap[((26) * (32) + (2))] = (165 % 512);
    ((screenblock *)0x6000000)[24].tilemap[((26) * (32) + (3))] = (166 % 512);
    ((screenblock *)0x6000000)[24].tilemap[((27) * (32) + (1))] = (196 % 512);
    ((screenblock *)0x6000000)[24].tilemap[((27) * (32) + (2))] = (197 % 512);
    ((screenblock *)0x6000000)[24].tilemap[((27) * (32) + (3))] = (198 % 512);
}

void resetGame2() {
    (*(volatile unsigned short *)0x04000018) = 0;
    (*(volatile unsigned short *)0x0400001A) = 0;


    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 30;

    player.x = 5;
    player.y = 56;
    initializeEnemy();
    initfruit2();
    player.fruit = 1;
}


void pauseToGame() {
    if (game == 1) {
        state = GAME;
        (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (2 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);
        hideSprites();
        (*(volatile unsigned short*)0x400000A) = 3 | ((0) << 2) | ((22) << 8) | (1 << 14) | (1 << 7);
        (*(volatile unsigned short*)0x400000C) = 2 | ((0) << 2) | ((24) << 8) | (1 << 14) | (1 << 7);

        DMANow(3, newgametilesetTiles, &((charblock *)0x06000000)[0], sizeof(newgametilesetTiles)/2);
        DMANow(3, newgametilesetPal, ((unsigned short *)0x5000000), sizeof(newgametilesetPal)/2);

        DMANow(3, cloudmapMap, &((screenblock *)0x6000000)[22], (4096)/2);
        DMANow(3, newgametilemapMap, &((screenblock *)0x6000000)[24], (4096)/2);
        DMANow(3, newgametilemap2Map, &((screenblock *)0x6000000)[26], (4096)/2);

        collisionMap = (unsigned char*) newcollisionmapBitmap;
    } else if (game == 2) {
        state = GAME2;
        (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (2 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);
        hideSprites();
        (*(volatile unsigned short*)0x400000A) = 3 | ((0) << 2) | ((22) << 8) | (1 << 14) | (1 << 7);
        (*(volatile unsigned short*)0x400000C) = 2 | ((0) << 2) | ((24) << 8) | (1 << 14) | (1 << 7);

        DMANow(3, newgametilesetTiles, &((charblock *)0x06000000)[0], sizeof(newgametilesetTiles)/2);
        DMANow(3, newgametilesetPal, ((unsigned short *)0x5000000), sizeof(newgametilesetPal)/2);

        DMANow(3, cloudmapMap, &((screenblock *)0x6000000)[22], (4096)/2);
        DMANow(3, newgametilemap2Map, &((screenblock *)0x6000000)[24], (4096)/2);

        collisionMap = (unsigned char*) newcollisionmap2Bitmap;
    }
}


void goToPause() {
    state = PAUSE;
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (2 % 4))) | (0 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x400000C) = 2 | ((0) << 2) | ((24) << 8) | (3 << 14) | (1 << 7);

    DMANow(3, newtilesetTiles, &((charblock *)0x06000000)[0], sizeof(newtilesetTiles)/2);
    DMANow(3, newtilesetPal, ((unsigned short *)0x5000000), sizeof(newtilesetPal)/2);

    DMANow(3, newTilemapMap, &((screenblock *)0x6000000)[24], (8192) / 2);

    DMANow(3, newgamespritesheetTiles, &((charblock *)0x06000000)[4], 32768/2);
    DMANow(3, newgamespritesheetPal, ((u16 *)0x5000200), 512 / 2);

    (*(volatile unsigned short *)0x04000018) = 0;
    (*(volatile unsigned short *)0x0400001A) = 160;
}

void goToLose() {
    initialize();
    state = LOSE;
}

inline unsigned char colorAt(int x, int y){
    return collisionMap[((y) * (512) + (x))];
}


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


void initwand() {
    wand.x = 80;
    wand.y = 216;
    wand.width = 2;
    wand.height = 8;
    wand.active = 1;
}


void initfruit() {
    fruit.x = 360;
    fruit.y = 71;
    fruit.width = 6;
    fruit.height = 10;
    fruit.active = 1;
}


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


void initBullet() {
    bullet.x = player.x;
    bullet.y = player.y + 3;
    bullet.width = 2;
    bullet.height = 2;
    bullet.active = 1;
}


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


void initializeLives() {
    for (int i = 0; i < 3; i++) {
        life[i].width = 5;
        life[i].height = 5;
        life[i].x = 204+(11*i);
        life[i].y = 6;
        life[i].active = 1;
    }
}


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

    hOff = player.x - (240 - player.width) / 2;
    vOff = player.y - (160 - player.height) / 2;
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff > 256 - 160) vOff = 256 - 160;

    hOff2 = ((player.x) - (240 - player.width) / 2) / 3;
    if (hOff2 < 0) hOff2 = 0;
    if (hOff2 > 512 - 240) hOff2 = 512 - 240;
}


void updatePlayer() {


    if ((~(buttons) & ((1<<4))) && (colorAt(player.x + 8, player.y)) && (colorAt(player.x + 8, player.y + player.height - 1))) {
        if (player.fruit) {
            player.x++;
            player.right = 1;
        } else if (!player.fruit && player.x < 511) {
            player.x++;
            player.right = 1;
        }
    }
    if ((~(buttons) & ((1<<5))) && (colorAt(player.x - 1, player.y)) && (colorAt(player.x - 1, player.y + player.height - 1)) && player.x > 0) {
        player.x--;
        player.left = 1;
    }

    if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && (colorAt(player.x, player.y - 1)) && player.onGround > 0) {

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

        if (colorAt(player.x, player.y + 9) && (colorAt(player.x + player.width - 1, player.y + 9))) {
            player.y += 2;
        }
        if (colorAt(player.x, player.y + 8) && (colorAt(player.x + player.width - 1, player.y + 8))) {
            player.y += 1;
        }
    }

    if (!colorAt(player.x, player.y + 8) | (!colorAt(player.x + player.width - 1, player.y + 8))) {

        player.onGround = 2;
    }
    if (!colorAt(player.x, player.y + 9) | (!colorAt(player.x + player.width - 1, player.y + 9))) {
        player.onGround = 2;
    }
    if (!colorAt(player.x + 4, player.y + 8) | (!colorAt(player.x + player.width - 1, player.y + 8))) {

        player.onGround = 2;
    }
    if (!colorAt(player.x + 4, player.y + 9) | (!colorAt(player.x + player.width - 1, player.y + 9))) {
        player.onGround = 2;
    }


    if (player.y >= 245) {
        loseLife();
        if (state == GAME) {
            resetGame();
        } else if (state == GAME2) {
            resetGame2();
        }
    }


    if (player.wand && (!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        initBullet();
    }


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

    shadowOAM[0].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
    shadowOAM[0].attr1 = (0<<14) | ((player.x - hOff) & 0x1FF);


    if (player.jumping) {
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (1)) & 0x3FF) | (((0) & 3) << 10);
    } else if (player.left) {
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (3)) & 0x3FF) | (((0) & 3) << 10);
        player.left = 0;
    } else if (player.right) {
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (2)) & 0x3FF) | (((0) & 3) << 10);
        player.right = 0;
    } else {
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (4)) & 0x3FF) | (((0) & 3) << 10);
    }


}



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
                    shadowOAM[3].attr0 = (2<<8);
                }
            }
        }
}


void updatewand() {
    if (wand.active) {
        shadowOAM[2].attr0 = (0<<13) | (0<<14) | ((wand.y - vOff) & 0xFF);
        shadowOAM[2].attr1 = (0<<14) | ((wand.x - hOff) & 0x1FF);
        shadowOAM[2].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (6)) & 0x3FF) | (((0) & 3) << 10);
    }


    if (collision(player.x, player.y, player.width, player.height, wand.x, wand.y, wand.width, wand.height) && ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))))) {
        shadowOAM[2].attr0 = (2<<8);
        wand.active = 0;
        player.wand = 1;
    }

}


void updateBullet() {
    if (bullet.active) {
        bullet.x += 2;
        shadowOAM[3].attr0 = (0<<13) | (0<<14) | ((bullet.y - vOff) & 0xFF);
        shadowOAM[3].attr1 = (0<<14) | ((bullet.x - hOff) & 0x1FF);
        shadowOAM[3].attr2 = (((0) & 0xF) << 12) | (((1) * 32 + (6)) & 0x3FF) | (((0) & 3) << 10);
    }


    if (bullet.x >= 511) {
        bullet.active = 0;
        shadowOAM[3].attr0 = (2<<8);
    }
}

void updateFruit() {
    if (fruit.active) {
        shadowOAM[1].attr0 = (0<<13) | (2<<14) | ((fruit.y - vOff) & 0xFF);
        shadowOAM[1].attr1 = (0<<14) | ((fruit.x - hOff) & 0x1FF);
        shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((3) * 32 + (1)) & 0x3FF) | (((0) & 3) << 10);
    }


    if (collision(player.x, player.y, player.width, player.height, fruit.x, fruit.y, fruit.width, fruit.height) && ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))))) {
        shadowOAM[1].attr0 = (2<<8);
        fruit.active = 0;
        player.fruit++;
    }
}

void updateFruit2(SPRITE* e) {
    if (e->active) {
        if (collision(player.x, player.y, player.width, player.height, e->x, e->y, e->width, e->height) && ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))))) {
            e->active = 0;
            player.fruit++;
        }
    }
}

void updateCheat() {
    if (cheat.active) {
        shadowOAM[10].attr0 = (0<<13) | (2<<14) | ((cheat.y - vOff) & 0xFF);
        shadowOAM[10].attr1 = (0<<14) | ((cheat.x - hOff) & 0x1FF);
        shadowOAM[10].attr2 = (((0) & 0xF) << 12) | (((3) * 32 + (2)) & 0x3FF) | (((0) & 3) << 10);
    }

    if (collision(player.x, player.y, player.width, player.height, cheat.x, cheat.y, cheat.width, cheat.height) && ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))))) {
        shadowOAM[10].attr0 = (2<<8);
        cheat.active = 0;
        player.cheat = 1;
        ((screenblock *)0x6000000)[24].tilemap[((25) * (32) + (2))] = (6 % 512);
        ((screenblock *)0x6000000)[24].tilemap[((26) * (32) + (1))] = (6 % 512);
        ((screenblock *)0x6000000)[24].tilemap[((26) * (32) + (2))] = (6 % 512);
        ((screenblock *)0x6000000)[24].tilemap[((26) * (32) + (3))] = (6 % 512);
        ((screenblock *)0x6000000)[24].tilemap[((27) * (32) + (1))] = (6 % 512);
        ((screenblock *)0x6000000)[24].tilemap[((27) * (32) + (2))] = (6 % 512);
        ((screenblock *)0x6000000)[24].tilemap[((27) * (32) + (3))] = (6 % 512);
    }
}


void loseLife() {
    if (player.lives == 3) {
        life[0].active = 0;
        player.lives--;
        shadowOAM[4].attr0 = (2<<8);
    } else if (player.lives == 2) {
        ((u16 *)0x5000200)[18] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        player.lives--;
        life[1].active = 0;
        shadowOAM[5].attr0 = (2<<8);
    } else if (player.lives == 1) {
        player.lives--;
    }
}


void drawLives() {
    for (int i = 0; i < 3; i++) {
        if (life[i].active) {
            shadowOAM[i+4].attr0 = (0<<13) | (0<<14) | ((life[i].y) & 0xFF);
            shadowOAM[i+4].attr1 = (0<<14) | ((life[i].x) & 0x1FF);
            shadowOAM[i+4].attr2 = (((1) & 0xF) << 12) | (((2) * 32 + (7)) & 0x3FF);
        }
    }
}


void drawEnemy() {
    for (int i = 0; i < 3; i++) {
        if (enemy[i].active) {
                if (enemy[i].time >= 0 && enemy[i].time < 30) {
                    shadowOAM[i + 7].attr0 = (0<<13) | (2<<14) | ((enemy[i].y - vOff) & 0xFF);
                    shadowOAM[i + 7].attr1 = (0<<14) | ((enemy[i].x - hOff) & 0x1FF);
                    shadowOAM[i + 7].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (13)) & 0x3FF) | (((0) & 3) << 10);
                    enemy[i].time++;
                } else if (enemy[i].time >= 30 && enemy[i].time < 60) {
                    shadowOAM[i + 7].attr0 = (0<<13) | (2<<14) | ((enemy[i].y - vOff) & 0xFF);
                    shadowOAM[i + 7].attr1 = (0<<14) | ((enemy[i].x - hOff) & 0x1FF);
                    shadowOAM[i + 7].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (12)) & 0x3FF) | (((0) & 3) << 10);
                    enemy[i].time++;
                } else if (enemy[i].time >= 60 && enemy[i].time < 90) {
                    shadowOAM[i + 7].attr0 = (0<<13) | (2<<14) | ((enemy[i].y - vOff) & 0xFF);
                    shadowOAM[i + 7].attr1 = (0<<14) | ((enemy[i].x - hOff) & 0x1FF);
                    shadowOAM[i + 7].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (13)) & 0x3FF) | (((0) & 3) << 10);
                    enemy[i].time++;
                } else if (enemy[i].time >= 90 && enemy[i].time < 119) {
                    shadowOAM[i + 7].attr0 = (0<<13) | (2<<14) | ((enemy[i].y - vOff) & 0xFF);
                    shadowOAM[i + 7].attr1 = (0<<14) | ((enemy[i].x - hOff) & 0x1FF);
                    shadowOAM[i + 7].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (14)) & 0x3FF) | (((0) & 3) << 10);
                    enemy[i].time++;
                } else {
                    enemy[i].time = 0;
                }
        } else {
            shadowOAM[i + 7].attr0 = (2<<8);
        }
    }
}


void drawFruit2() {
    for (int i = 0; i < 2; i++) {
        if (fruit2[i].active && (state == GAME2)) {
            if (i == 0) {
                shadowOAM[11].attr0 = (0<<13) | (2<<14) | ((fruit2[i].y - vOff) & 0xFF);
                shadowOAM[11].attr1 = (0<<14) | ((fruit2[i].x - hOff) & 0x1FF);
                shadowOAM[11].attr2 = (((0) & 0xF) << 12) | (((3) * 32 + (1)) & 0x3FF) | (((0) & 3) << 10);
            } else if (i == 1) {
                shadowOAM[12].attr0 = (0<<13) | (2<<14) | ((fruit2[i].y - vOff) & 0xFF);
                shadowOAM[12].attr1 = (0<<14) | ((fruit2[i].x - hOff) & 0x1FF);
                shadowOAM[12].attr2 = (((0) & 0xF) << 12) | (((3) * 32 + (1)) & 0x3FF) | (((0) & 3) << 10);
            }
        } else {
            shadowOAM[i + 11].attr0 = (2<<8);
        }
    }
}

void draw() {
    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x0400001A) = vOff;

    (*(volatile unsigned short *)0x04000014) = hOff2;
    (*(volatile unsigned short *)0x04000016) = vOff2;
    drawLives();
    drawEnemy();
    drawFruit2();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

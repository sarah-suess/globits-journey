# 1 "sprites.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sprites.c"
# 1 "sprites.h" 1



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
# 5 "sprites.h" 2





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
# 2 "sprites.c" 2


void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}

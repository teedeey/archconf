/* user and group to drop privileges to */
static const char *user  = "username";
static const char *group = "username";

static const char *colorname[NUMCOLS] = {
        [BACKGROUND] = "black",     /* after initialization */
        [INIT]     =   "#2d2d2d",
	[INPUT]    =   "#005577",   /* during input */
	[FAILED]   =   "#770000",   /* wrong password */
 	[CAPS]     =   "#774300",   /* CapsLock on */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 5;


/* insert grid pattern with scale 1:1, the size can be changed with logosize */
static const int logosize = 50;
static const int logow = 26;   /* grid width and height for right center alignment*/
static const int logoh = 6;

static XRectangle rectangles[] = {
       /* x    y       w       h */
       { 0,    0,      1,      6 },
       { 1,    5,      1,      1 },
       { 3,    2,      1,      4 },
       { 4,    2,      1,      1 },
       { 4,    5,      1,      1 },
       { 5,    2,      1,      4 },
       { 7,    2,      1,      4 },
       { 8,    2,      1,      1 },
       { 8,    5,      1,      1 },
       { 10,   0,      1,      6 },
       { 11,   2,      1,      2 },
       { 12,   1,      1,      4 },
       { 13,   0,      1,      2 },
       { 13,   4,      1,      2 },
       { 14,   0,      1,      1 },
       { 14,   5,      1,      1 },
       { 16,   1,      1,      5 },
       { 17,   1,      1,      1 },
       { 17,   3,      1,      1 },
       { 17,   5,      1,      1 },
       { 18,   1,      1,      3 },
       { 18,   5,      1,      1 },
       { 20,   0,      1,      6 },
       { 21,   0,      1,      1 },
       { 21,   5,      1,      1 },
       { 22,   0,      1,      2 },
       { 22,   4,      1,      2 },
       { 23,   1,      1,      4 },
       { 25,   0,      1,      4 },
       { 25,   5,      1,      1 },
};


/* default message */
static const char * message = "";

/* text color */
static const char * text_color = "#ffffff";

/* text size (must be a valid size) */
static const char * font_name = "fixed";

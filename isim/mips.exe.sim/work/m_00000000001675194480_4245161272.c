/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static unsigned int ng0[] = {0U, 0U};
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {3U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {5U, 0U};
static unsigned int ng6[] = {6U, 0U};
static unsigned int ng7[] = {7U, 0U};



static void Always_30_0(char *t0)
{
    char t6[8];
    char t31[8];
    char t57[8];
    char t58[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:
LAB5:    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng0)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB16;

LAB13:    if (t18 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t6) = 1;

LAB16:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB17;

LAB18:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB23;

LAB20:    if (t18 != 0)
        goto LAB22;

LAB21:    *((unsigned int *)t6) = 1;

LAB23:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB24;

LAB25:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB33;

LAB30:    if (t18 != 0)
        goto LAB32;

LAB31:    *((unsigned int *)t6) = 1;

LAB33:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB34;

LAB35:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB57;

LAB54:    if (t18 != 0)
        goto LAB56;

LAB55:    *((unsigned int *)t6) = 1;

LAB57:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB58;

LAB59:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB64;

LAB61:    if (t18 != 0)
        goto LAB63;

LAB62:    *((unsigned int *)t6) = 1;

LAB64:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB65;

LAB66:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB74;

LAB71:    if (t18 != 0)
        goto LAB73;

LAB72:    *((unsigned int *)t6) = 1;

LAB74:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB75;

LAB76:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng7)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB81;

LAB78:    if (t18 != 0)
        goto LAB80;

LAB79:    *((unsigned int *)t6) = 1;

LAB81:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB82;

LAB83:
LAB84:
LAB77:
LAB67:
LAB60:
LAB36:
LAB26:
LAB19:
LAB12:    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng0)));
    memset(t57, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB93;

LAB90:    if (t18 != 0)
        goto LAB92;

LAB91:    *((unsigned int *)t57) = 1;

LAB93:    memset(t31, 0, 8);
    t22 = (t57 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t57);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB94;

LAB95:    if (*((unsigned int *)t22) != 0)
        goto LAB96;

LAB97:    t29 = (t31 + 4);
    t32 = *((unsigned int *)t31);
    t33 = *((unsigned int *)t29);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB98;

LAB99:    t35 = *((unsigned int *)t31);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB100;

LAB101:    if (*((unsigned int *)t29) > 0)
        goto LAB102;

LAB103:    if (*((unsigned int *)t31) > 0)
        goto LAB104;

LAB105:    memcpy(t6, t42, 8);

LAB106:    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t6, 0, 0, 1);
    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    t28 = (t0 + 1208U);
    t29 = *((char **)t28);
    t28 = (t0 + 1368U);
    t30 = *((char **)t28);
    memset(t31, 0, 8);
    xsi_vlog_unsigned_add(t31, 32, t29, 32, t30, 32);
    t28 = (t0 + 1928);
    xsi_vlogvar_assign_value(t28, t31, 0, 0, 32);
    goto LAB12;

LAB15:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB16;

LAB17:    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = (t0 + 1368U);
    t28 = *((char **)t21);
    memset(t31, 0, 8);
    xsi_vlog_unsigned_minus(t31, 32, t22, 32, t28, 32);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t31, 0, 0, 32);
    goto LAB19;

LAB22:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB23;

LAB24:    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = (t0 + 1368U);
    t28 = *((char **)t21);
    t32 = *((unsigned int *)t22);
    t33 = *((unsigned int *)t28);
    t34 = (t32 | t33);
    *((unsigned int *)t31) = t34;
    t21 = (t22 + 4);
    t29 = (t28 + 4);
    t30 = (t31 + 4);
    t35 = *((unsigned int *)t21);
    t36 = *((unsigned int *)t29);
    t37 = (t35 | t36);
    *((unsigned int *)t30) = t37;
    t38 = *((unsigned int *)t30);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB27;

LAB28:
LAB29:    t56 = (t0 + 1928);
    xsi_vlogvar_assign_value(t56, t31, 0, 0, 32);
    goto LAB26;

LAB27:    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t30);
    *((unsigned int *)t31) = (t40 | t41);
    t42 = (t22 + 4);
    t43 = (t28 + 4);
    t44 = *((unsigned int *)t42);
    t45 = (~(t44));
    t46 = *((unsigned int *)t22);
    t47 = (t46 & t45);
    t48 = *((unsigned int *)t43);
    t49 = (~(t48));
    t50 = *((unsigned int *)t28);
    t51 = (t50 & t49);
    t52 = (~(t47));
    t53 = (~(t51));
    t54 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t54 & t52);
    t55 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t55 & t53);
    goto LAB29;

LAB32:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB33;

LAB34:    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = (t0 + 1368U);
    t28 = *((char **)t21);
    memset(t58, 0, 8);
    t21 = (t22 + 4);
    t29 = (t28 + 4);
    t32 = *((unsigned int *)t22);
    t33 = *((unsigned int *)t28);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t21);
    t36 = *((unsigned int *)t29);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t21);
    t40 = *((unsigned int *)t29);
    t41 = (t39 | t40);
    t44 = (~(t41));
    t45 = (t38 & t44);
    if (t45 != 0)
        goto LAB40;

LAB37:    if (t41 != 0)
        goto LAB39;

LAB38:    *((unsigned int *)t58) = 1;

LAB40:    memset(t57, 0, 8);
    t42 = (t58 + 4);
    t46 = *((unsigned int *)t42);
    t48 = (~(t46));
    t49 = *((unsigned int *)t58);
    t50 = (t49 & t48);
    t52 = (t50 & 1U);
    if (t52 != 0)
        goto LAB41;

LAB42:    if (*((unsigned int *)t42) != 0)
        goto LAB43;

LAB44:    t56 = (t57 + 4);
    t53 = *((unsigned int *)t57);
    t54 = *((unsigned int *)t56);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB45;

LAB46:    t60 = *((unsigned int *)t57);
    t61 = (~(t60));
    t62 = *((unsigned int *)t56);
    t63 = (t61 || t62);
    if (t63 > 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t56) > 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t57) > 0)
        goto LAB51;

LAB52:    memcpy(t31, t64, 8);

LAB53:    t65 = (t0 + 1928);
    xsi_vlogvar_assign_value(t65, t31, 0, 0, 32);
    goto LAB36;

LAB39:    t30 = (t58 + 4);
    *((unsigned int *)t58) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB40;

LAB41:    *((unsigned int *)t57) = 1;
    goto LAB44;

LAB43:    t43 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB44;

LAB45:    t59 = ((char*)((ng1)));
    goto LAB46;

LAB47:    t64 = ((char*)((ng0)));
    goto LAB48;

LAB49:    xsi_vlog_unsigned_bit_combine(t31, 32, t59, 32, t64, 32);
    goto LAB53;

LAB51:    memcpy(t31, t59, 8);
    goto LAB53;

LAB56:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB57;

LAB58:    t21 = ((char*)((ng0)));
    t22 = (t0 + 1368U);
    t28 = *((char **)t22);
    memset(t57, 0, 8);
    t22 = (t57 + 4);
    t29 = (t28 + 4);
    t32 = *((unsigned int *)t28);
    t33 = (t32 >> 0);
    *((unsigned int *)t57) = t33;
    t34 = *((unsigned int *)t29);
    t35 = (t34 >> 0);
    *((unsigned int *)t22) = t35;
    t36 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t36 & 65535U);
    t37 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t37 & 65535U);
    xsi_vlogtype_concat(t31, 32, 32, 2U, t57, 16, t21, 16);
    t30 = (t0 + 1928);
    xsi_vlogvar_assign_value(t30, t31, 0, 0, 32);
    goto LAB60;

LAB63:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB64;

LAB65:    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = (t0 + 1368U);
    t28 = *((char **)t21);
    t32 = *((unsigned int *)t22);
    t33 = *((unsigned int *)t28);
    t34 = (t32 & t33);
    *((unsigned int *)t31) = t34;
    t21 = (t22 + 4);
    t29 = (t28 + 4);
    t30 = (t31 + 4);
    t35 = *((unsigned int *)t21);
    t36 = *((unsigned int *)t29);
    t37 = (t35 | t36);
    *((unsigned int *)t30) = t37;
    t38 = *((unsigned int *)t30);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB68;

LAB69:
LAB70:    t56 = (t0 + 1928);
    xsi_vlogvar_assign_value(t56, t31, 0, 0, 32);
    goto LAB67;

LAB68:    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t30);
    *((unsigned int *)t31) = (t40 | t41);
    t42 = (t22 + 4);
    t43 = (t28 + 4);
    t44 = *((unsigned int *)t22);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t48 = (~(t46));
    t49 = *((unsigned int *)t28);
    t50 = (~(t49));
    t52 = *((unsigned int *)t43);
    t53 = (~(t52));
    t47 = (t45 & t48);
    t51 = (t50 & t53);
    t54 = (~(t47));
    t55 = (~(t51));
    t60 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t60 & t54);
    t61 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t61 & t55);
    t62 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t62 & t54);
    t63 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t63 & t55);
    goto LAB70;

LAB73:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB74;

LAB75:    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = (t0 + 1368U);
    t28 = *((char **)t21);
    memset(t58, 0, 8);
    xsi_vlog_signed_less(t58, 32, t22, 32, t28, 32);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t58, 0, 0, 32);
    goto LAB77;

LAB80:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB81;

LAB82:    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = (t0 + 1368U);
    t28 = *((char **)t21);
    memset(t31, 0, 8);
    t21 = (t22 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB86;

LAB85:    t29 = (t28 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB86;

LAB89:    if (*((unsigned int *)t22) < *((unsigned int *)t28))
        goto LAB87;

LAB88:    t42 = (t0 + 1928);
    xsi_vlogvar_assign_value(t42, t31, 0, 0, 32);
    goto LAB84;

LAB86:    t30 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB88;

LAB87:    *((unsigned int *)t31) = 1;
    goto LAB88;

LAB92:    t21 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB93;

LAB94:    *((unsigned int *)t31) = 1;
    goto LAB97;

LAB96:    t28 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB97;

LAB98:    t30 = ((char*)((ng1)));
    goto LAB99;

LAB100:    t42 = ((char*)((ng0)));
    goto LAB101;

LAB102:    xsi_vlog_unsigned_bit_combine(t6, 1, t30, 1, t42, 1);
    goto LAB106;

LAB104:    memcpy(t6, t30, 8);
    goto LAB106;

}


extern void work_m_00000000001675194480_4245161272_init()
{
	static char *pe[] = {(void *)Always_30_0};
	xsi_register_didat("work_m_00000000001675194480_4245161272", "isim/mips.exe.sim/work/m_00000000001675194480_4245161272.didat");
	xsi_register_executes(pe);
}

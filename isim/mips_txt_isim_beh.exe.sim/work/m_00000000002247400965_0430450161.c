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
static const char *ng0 = "D:/verilogFile/cpuPipeline/DM_EXT.v";
static unsigned int ng1[] = {2U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {25, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static int ng7[] = {17, 0};



static void Always_27_0(char *t0)
{
    char t6[8];
    char t30[8];
    char t52[8];
    char t53[8];
    char t63[8];
    char t67[8];
    char t76[8];
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
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t64;
    char *t65;
    char *t66;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
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

LAB11:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1368U);
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
        goto LAB45;

LAB42:    if (t18 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t6) = 1;

LAB45:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(37, ng0);

LAB64:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 1768);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);

LAB48:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(29, ng0);

LAB13:    xsi_set_current_line(30, ng0);
    t28 = (t0 + 1048U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng2)));
    memset(t30, 0, 8);
    t31 = (t29 + 4);
    t32 = (t28 + 4);
    t33 = *((unsigned int *)t29);
    t34 = *((unsigned int *)t28);
    t35 = (t33 ^ t34);
    t36 = *((unsigned int *)t31);
    t37 = *((unsigned int *)t32);
    t38 = (t36 ^ t37);
    t39 = (t35 | t38);
    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t32);
    t42 = (t40 | t41);
    t43 = (~(t42));
    t44 = (t39 & t43);
    if (t44 != 0)
        goto LAB17;

LAB14:    if (t42 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t30) = 1;

LAB17:    t46 = (t30 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t49 = *((unsigned int *)t30);
    t50 = (t49 & t48);
    t51 = (t50 != 0);
    if (t51 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1048U);
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
        goto LAB24;

LAB21:    if (t18 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t6) = 1;

LAB24:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1048U);
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
        goto LAB31;

LAB28:    if (t18 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t6) = 1;

LAB31:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1048U);
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
        goto LAB38;

LAB35:    if (t18 != 0)
        goto LAB37;

LAB36:    *((unsigned int *)t6) = 1;

LAB38:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB39;

LAB40:
LAB41:
LAB34:
LAB27:
LAB20:    goto LAB12;

LAB16:    t45 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(30, ng0);
    t54 = (t0 + 1208U);
    t55 = *((char **)t54);
    memset(t53, 0, 8);
    t54 = (t53 + 4);
    t56 = (t55 + 4);
    t57 = *((unsigned int *)t55);
    t58 = (t57 >> 0);
    *((unsigned int *)t53) = t58;
    t59 = *((unsigned int *)t56);
    t60 = (t59 >> 0);
    *((unsigned int *)t54) = t60;
    t61 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t61 & 127U);
    t62 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t62 & 127U);
    t64 = ((char*)((ng3)));
    t65 = (t0 + 1208U);
    t66 = *((char **)t65);
    memset(t67, 0, 8);
    t65 = (t67 + 4);
    t68 = (t66 + 4);
    t69 = *((unsigned int *)t66);
    t70 = (t69 >> 7);
    t71 = (t70 & 1);
    *((unsigned int *)t67) = t71;
    t72 = *((unsigned int *)t68);
    t73 = (t72 >> 7);
    t74 = (t73 & 1);
    *((unsigned int *)t65) = t74;
    xsi_vlog_mul_concat(t63, 25, 1, t64, 1U, t67, 1);
    xsi_vlogtype_concat(t52, 32, 32, 2U, t63, 25, t53, 7);
    t75 = (t0 + 1768);
    xsi_vlogvar_assign_value(t75, t52, 0, 0, 32);
    goto LAB20;

LAB23:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(31, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    memset(t52, 0, 8);
    t21 = (t52 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 8);
    *((unsigned int *)t52) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 8);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t37 & 127U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 127U);
    t29 = ((char*)((ng3)));
    t31 = (t0 + 1208U);
    t32 = *((char **)t31);
    memset(t63, 0, 8);
    t31 = (t63 + 4);
    t45 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    t40 = (t39 >> 15);
    t41 = (t40 & 1);
    *((unsigned int *)t63) = t41;
    t42 = *((unsigned int *)t45);
    t43 = (t42 >> 15);
    t44 = (t43 & 1);
    *((unsigned int *)t31) = t44;
    xsi_vlog_mul_concat(t53, 25, 1, t29, 1U, t63, 1);
    xsi_vlogtype_concat(t30, 32, 32, 2U, t53, 25, t52, 7);
    t46 = (t0 + 1768);
    xsi_vlogvar_assign_value(t46, t30, 0, 0, 32);
    goto LAB27;

LAB30:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB31;

LAB32:    xsi_set_current_line(32, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    memset(t52, 0, 8);
    t21 = (t52 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 16);
    *((unsigned int *)t52) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 16);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t37 & 127U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 127U);
    t29 = ((char*)((ng3)));
    t31 = (t0 + 1208U);
    t32 = *((char **)t31);
    memset(t63, 0, 8);
    t31 = (t63 + 4);
    t45 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    t40 = (t39 >> 23);
    t41 = (t40 & 1);
    *((unsigned int *)t63) = t41;
    t42 = *((unsigned int *)t45);
    t43 = (t42 >> 23);
    t44 = (t43 & 1);
    *((unsigned int *)t31) = t44;
    xsi_vlog_mul_concat(t53, 25, 1, t29, 1U, t63, 1);
    xsi_vlogtype_concat(t30, 32, 32, 2U, t53, 25, t52, 7);
    t46 = (t0 + 1768);
    xsi_vlogvar_assign_value(t46, t30, 0, 0, 32);
    goto LAB34;

LAB37:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB38;

LAB39:    xsi_set_current_line(33, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    memset(t52, 0, 8);
    t21 = (t52 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 24);
    *((unsigned int *)t52) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 24);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t37 & 127U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 127U);
    t29 = ((char*)((ng3)));
    t31 = (t0 + 1208U);
    t32 = *((char **)t31);
    memset(t63, 0, 8);
    t31 = (t63 + 4);
    t45 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    t40 = (t39 >> 31);
    t41 = (t40 & 1);
    *((unsigned int *)t63) = t41;
    t42 = *((unsigned int *)t45);
    t43 = (t42 >> 31);
    t44 = (t43 & 1);
    *((unsigned int *)t31) = t44;
    xsi_vlog_mul_concat(t53, 25, 1, t29, 1U, t63, 1);
    xsi_vlogtype_concat(t30, 32, 32, 2U, t53, 25, t52, 7);
    t46 = (t0 + 1768);
    xsi_vlogvar_assign_value(t46, t30, 0, 0, 32);
    goto LAB41;

LAB44:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB45;

LAB46:    xsi_set_current_line(34, ng0);

LAB49:    xsi_set_current_line(35, ng0);
    t21 = (t0 + 1048U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 1);
    t35 = (t34 & 1);
    *((unsigned int *)t30) = t35;
    t36 = *((unsigned int *)t28);
    t37 = (t36 >> 1);
    t38 = (t37 & 1);
    *((unsigned int *)t21) = t38;
    t29 = ((char*)((ng2)));
    memset(t52, 0, 8);
    t31 = (t30 + 4);
    t32 = (t29 + 4);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t29);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t31);
    t43 = *((unsigned int *)t32);
    t44 = (t42 ^ t43);
    t47 = (t41 | t44);
    t48 = *((unsigned int *)t31);
    t49 = *((unsigned int *)t32);
    t50 = (t48 | t49);
    t51 = (~(t50));
    t57 = (t47 & t51);
    if (t57 != 0)
        goto LAB53;

LAB50:    if (t50 != 0)
        goto LAB52;

LAB51:    *((unsigned int *)t52) = 1;

LAB53:    t46 = (t52 + 4);
    t58 = *((unsigned int *)t46);
    t59 = (~(t58));
    t60 = *((unsigned int *)t52);
    t61 = (t60 & t59);
    t62 = (t61 != 0);
    if (t62 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 1);
    t14 = (t13 & 1);
    *((unsigned int *)t2) = t14;
    t5 = ((char*)((ng4)));
    memset(t30, 0, 8);
    t7 = (t6 + 4);
    t8 = (t5 + 4);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t8);
    t20 = (t18 ^ t19);
    t23 = (t17 | t20);
    t24 = *((unsigned int *)t7);
    t25 = *((unsigned int *)t8);
    t26 = (t24 | t25);
    t27 = (~(t26));
    t33 = (t23 & t27);
    if (t33 != 0)
        goto LAB60;

LAB57:    if (t26 != 0)
        goto LAB59;

LAB58:    *((unsigned int *)t30) = 1;

LAB60:    t22 = (t30 + 4);
    t34 = *((unsigned int *)t22);
    t35 = (~(t34));
    t36 = *((unsigned int *)t30);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB61;

LAB62:
LAB63:
LAB56:    goto LAB48;

LAB52:    t45 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB53;

LAB54:    xsi_set_current_line(35, ng0);
    t54 = (t0 + 1208U);
    t55 = *((char **)t54);
    memset(t63, 0, 8);
    t54 = (t63 + 4);
    t56 = (t55 + 4);
    t69 = *((unsigned int *)t55);
    t70 = (t69 >> 0);
    *((unsigned int *)t63) = t70;
    t71 = *((unsigned int *)t56);
    t72 = (t71 >> 0);
    *((unsigned int *)t54) = t72;
    t73 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t73 & 32767U);
    t74 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t74 & 32767U);
    t64 = ((char*)((ng7)));
    t65 = (t0 + 1208U);
    t66 = *((char **)t65);
    memset(t76, 0, 8);
    t65 = (t76 + 4);
    t68 = (t66 + 4);
    t77 = *((unsigned int *)t66);
    t78 = (t77 >> 15);
    t79 = (t78 & 1);
    *((unsigned int *)t76) = t79;
    t80 = *((unsigned int *)t68);
    t81 = (t80 >> 15);
    t82 = (t81 & 1);
    *((unsigned int *)t65) = t82;
    xsi_vlog_mul_concat(t67, 17, 1, t64, 1U, t76, 1);
    xsi_vlogtype_concat(t53, 32, 32, 2U, t67, 17, t63, 15);
    t75 = (t0 + 1768);
    xsi_vlogvar_assign_value(t75, t53, 0, 0, 32);
    goto LAB56;

LAB59:    t21 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB60;

LAB61:    xsi_set_current_line(36, ng0);
    t28 = (t0 + 1208U);
    t29 = *((char **)t28);
    memset(t53, 0, 8);
    t28 = (t53 + 4);
    t31 = (t29 + 4);
    t39 = *((unsigned int *)t29);
    t40 = (t39 >> 16);
    *((unsigned int *)t53) = t40;
    t41 = *((unsigned int *)t31);
    t42 = (t41 >> 16);
    *((unsigned int *)t28) = t42;
    t43 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t43 & 32767U);
    t44 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t44 & 32767U);
    t32 = ((char*)((ng7)));
    t45 = (t0 + 1208U);
    t46 = *((char **)t45);
    memset(t67, 0, 8);
    t45 = (t67 + 4);
    t54 = (t46 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (t47 >> 31);
    t49 = (t48 & 1);
    *((unsigned int *)t67) = t49;
    t50 = *((unsigned int *)t54);
    t51 = (t50 >> 31);
    t57 = (t51 & 1);
    *((unsigned int *)t45) = t57;
    xsi_vlog_mul_concat(t63, 17, 1, t32, 1U, t67, 1);
    xsi_vlogtype_concat(t52, 32, 32, 2U, t63, 17, t53, 15);
    t55 = (t0 + 1768);
    xsi_vlogvar_assign_value(t55, t52, 0, 0, 32);
    goto LAB63;

}


extern void work_m_00000000002247400965_0430450161_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000002247400965_0430450161", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002247400965_0430450161.didat");
	xsi_register_executes(pe);
}

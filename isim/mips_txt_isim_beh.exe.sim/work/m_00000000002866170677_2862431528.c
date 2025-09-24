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
static const char *ng0 = "D:/verilogFile/cpuPipeline/D_CMP.v";
static int ng1[] = {31, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {0, 0};



static void Always_31_0(char *t0)
{
    char t14[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 3488);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(32, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(34, ng0);

LAB15:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB16;

LAB17:    xsi_set_current_line(37, ng0);

LAB27:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB30:
LAB18:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(32, ng0);

LAB9:    xsi_set_current_line(33, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    t11 = (t0 + 1528U);
    t13 = *((char **)t11);
    memset(t14, 0, 8);
    t11 = (t12 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB11;

LAB10:    t15 = (t13 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t12) < *((unsigned int *)t13))
        goto LAB12;

LAB13:    t17 = (t0 + 2248);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 1);
    goto LAB8;

LAB11:    t16 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB13;

LAB12:    *((unsigned int *)t14) = 1;
    goto LAB13;

LAB16:    xsi_set_current_line(35, ng0);

LAB19:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 1328U);
    t11 = (t4 + 72U);
    t12 = *((char **)t11);
    t13 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t14, 32, t5, t12, 2, t13, 32, 1);
    t15 = ((char*)((ng2)));
    memset(t18, 0, 8);
    t16 = (t14 + 4);
    t17 = (t15 + 4);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t16);
    t23 = *((unsigned int *)t17);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t16);
    t27 = *((unsigned int *)t17);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB23;

LAB20:    if (t28 != 0)
        goto LAB22;

LAB21:    *((unsigned int *)t18) = 1;

LAB23:    t32 = (t18 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t18);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB24;

LAB25:
LAB26:    goto LAB18;

LAB22:    t31 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB23;

LAB24:    xsi_set_current_line(36, ng0);
    t38 = ((char*)((ng2)));
    t39 = (t0 + 2248);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 1);
    goto LAB26;

LAB28:    xsi_set_current_line(38, ng0);

LAB31:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    memset(t14, 0, 8);
    t11 = (t5 + 4);
    t12 = (t4 + 4);
    t19 = *((unsigned int *)t5);
    t20 = *((unsigned int *)t4);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t11);
    t23 = *((unsigned int *)t12);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB35;

LAB32:    if (t28 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t14) = 1;

LAB35:    t15 = (t14 + 4);
    t33 = *((unsigned int *)t15);
    t34 = (~(t33));
    t35 = *((unsigned int *)t14);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB36;

LAB37:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t14, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t19 = (t9 ^ t10);
    t20 = (t8 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB46;

LAB43:    if (t23 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t14) = 1;

LAB46:    t12 = (t14 + 4);
    t26 = *((unsigned int *)t12);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t14, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t19 = (t9 ^ t10);
    t20 = (t8 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB57;

LAB54:    if (t23 != 0)
        goto LAB56;

LAB55:    *((unsigned int *)t14) = 1;

LAB57:    t12 = (t14 + 4);
    t26 = *((unsigned int *)t12);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB58;

LAB59:
LAB60:
LAB49:
LAB38:    goto LAB30;

LAB34:    t13 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB35;

LAB36:    xsi_set_current_line(40, ng0);
    t16 = (t0 + 1368U);
    t17 = *((char **)t16);
    t16 = (t0 + 1528U);
    t31 = *((char **)t16);
    memset(t18, 0, 8);
    t16 = (t17 + 4);
    t32 = (t31 + 4);
    t40 = *((unsigned int *)t17);
    t41 = *((unsigned int *)t31);
    t42 = (t40 ^ t41);
    t43 = *((unsigned int *)t16);
    t44 = *((unsigned int *)t32);
    t45 = (t43 ^ t44);
    t46 = (t42 | t45);
    t47 = *((unsigned int *)t16);
    t48 = *((unsigned int *)t32);
    t49 = (t47 | t48);
    t50 = (~(t49));
    t51 = (t46 & t50);
    if (t51 != 0)
        goto LAB42;

LAB39:    if (t49 != 0)
        goto LAB41;

LAB40:    *((unsigned int *)t18) = 1;

LAB42:    t39 = (t0 + 2248);
    xsi_vlogvar_assign_value(t39, t18, 0, 0, 1);
    goto LAB38;

LAB41:    t38 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB42;

LAB45:    t11 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(41, ng0);
    t13 = (t0 + 1368U);
    t15 = *((char **)t13);
    t13 = (t0 + 1528U);
    t16 = *((char **)t13);
    memset(t18, 0, 8);
    t13 = (t15 + 4);
    t17 = (t16 + 4);
    t33 = *((unsigned int *)t15);
    t34 = *((unsigned int *)t16);
    t35 = (t33 ^ t34);
    t36 = *((unsigned int *)t13);
    t37 = *((unsigned int *)t17);
    t40 = (t36 ^ t37);
    t41 = (t35 | t40);
    t42 = *((unsigned int *)t13);
    t43 = *((unsigned int *)t17);
    t44 = (t42 | t43);
    t45 = (~(t44));
    t46 = (t41 & t45);
    if (t46 != 0)
        goto LAB51;

LAB50:    if (t44 != 0)
        goto LAB52;

LAB53:    t32 = (t0 + 2248);
    xsi_vlogvar_assign_value(t32, t18, 0, 0, 1);
    goto LAB49;

LAB51:    *((unsigned int *)t18) = 1;
    goto LAB53;

LAB52:    t31 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB53;

LAB56:    t11 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB57;

LAB58:    xsi_set_current_line(42, ng0);
    t13 = (t0 + 1368U);
    t15 = *((char **)t13);
    t13 = (t0 + 1528U);
    t16 = *((char **)t13);
    memset(t18, 0, 8);
    t13 = (t15 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB62;

LAB61:    t17 = (t16 + 4);
    if (*((unsigned int *)t17) != 0)
        goto LAB62;

LAB65:    if (*((unsigned int *)t15) < *((unsigned int *)t16))
        goto LAB63;

LAB64:    t32 = (t0 + 2248);
    xsi_vlogvar_assign_value(t32, t18, 0, 0, 1);
    goto LAB60;

LAB62:    t31 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB64;

LAB63:    *((unsigned int *)t18) = 1;
    goto LAB64;

}


extern void work_m_00000000002866170677_2862431528_init()
{
	static char *pe[] = {(void *)Always_31_0};
	xsi_register_didat("work_m_00000000002866170677_2862431528", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002866170677_2862431528.didat");
	xsi_register_executes(pe);
}

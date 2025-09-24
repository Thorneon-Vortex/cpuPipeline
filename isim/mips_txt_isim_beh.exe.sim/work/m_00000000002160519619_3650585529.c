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
static const char *ng0 = "D:/verilogFile/cpuPipeline/D_NPC.v";
static int ng1[] = {4, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static int ng4[] = {16, 0};
static int ng5[] = {2, 0};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {3U, 0U};



static void Always_33_0(char *t0)
{
    char t6[8];
    char t16[8];
    char t17[8];
    char t20[8];
    char t23[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    int t13;
    char *t14;
    char *t15;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t5, 32, t4, 32);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(43, ng0);

LAB20:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t3, 32, t2, 32);
    t4 = (t0 + 2248);
    xsi_vlogvar_assign_value(t4, t6, 0, 0, 32);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(36, ng0);

LAB9:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);

LAB10:    t4 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t13 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB8;

LAB11:    xsi_set_current_line(38, ng0);
    t7 = (t0 + 1048U);
    t14 = *((char **)t7);
    t7 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t14, 32, t7, 32);
    t15 = (t0 + 2248);
    xsi_vlogvar_assign_value(t15, t6, 0, 0, 32);
    goto LAB19;

LAB13:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng4)));
    t7 = (t0 + 1208U);
    t14 = *((char **)t7);
    memset(t17, 0, 8);
    t7 = (t17 + 4);
    t15 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 15);
    t10 = (t9 & 1);
    *((unsigned int *)t17) = t10;
    t11 = *((unsigned int *)t15);
    t12 = (t11 >> 15);
    t18 = (t12 & 1);
    *((unsigned int *)t7) = t18;
    xsi_vlog_mul_concat(t16, 16, 1, t3, 1U, t17, 1);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t16, 16, t4, 16);
    t19 = ((char*)((ng5)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_lshift(t20, 32, t6, 32, t19, 32);
    t21 = (t0 + 1048U);
    t22 = *((char **)t21);
    memset(t23, 0, 8);
    xsi_vlog_unsigned_add(t23, 32, t20, 32, t22, 32);
    t21 = (t0 + 2248);
    xsi_vlogvar_assign_value(t21, t23, 0, 0, 32);
    goto LAB19;

LAB15:    xsi_set_current_line(40, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1368U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t14 = *((char **)t4);
    memset(t16, 0, 8);
    t4 = (t16 + 4);
    t15 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 28);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t15);
    t11 = (t10 >> 28);
    *((unsigned int *)t4) = t11;
    t12 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t12 & 15U);
    t18 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t18 & 15U);
    xsi_vlogtype_concat(t6, 32, 32, 3U, t16, 4, t7, 26, t3, 2);
    t19 = (t0 + 2248);
    xsi_vlogvar_assign_value(t19, t6, 0, 0, 32);
    goto LAB19;

LAB17:    xsi_set_current_line(41, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB19;

}


extern void work_m_00000000002160519619_3650585529_init()
{
	static char *pe[] = {(void *)Always_33_0};
	xsi_register_didat("work_m_00000000002160519619_3650585529", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002160519619_3650585529.didat");
	xsi_register_executes(pe);
}

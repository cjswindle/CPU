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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/rajp/Projects/CPU/assignment_3/PixelGenerator.v";
static unsigned int ng1[] = {250000U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {8192U, 0U};
static int ng5[] = {2, 0};
static unsigned int ng6[] = {1U, 0U};
static int ng7[] = {8, 0};
static int ng8[] = {1, 0};
static unsigned int ng9[] = {255U, 0U};



static void Initial_37_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(37, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 31);

LAB1:    return;
}

static void Initial_41_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3688);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 2);

LAB1:    return;
}

static void Initial_47_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 4008);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);

LAB1:    return;
}

static void Cont_51_3(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 5664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 8);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 8);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 255U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 255U);
    t12 = (t0 + 7384);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 255U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 7);
    t25 = (t0 + 7224);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_55_4(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 5912U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 255U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 255U);
    t12 = (t0 + 7448);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 255U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 7);
    t25 = (t0 + 7240);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_59_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;

LAB0:    t1 = (t0 + 6160U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3368);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t4 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 3);
    *((unsigned int *)t4) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 3);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t13 & 127U);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 & 127U);
    t16 = (t0 + 3208);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t15, 0, 8);
    t19 = (t15 + 4);
    t20 = (t18 + 4);
    t21 = *((unsigned int *)t18);
    t22 = (t21 >> 3);
    *((unsigned int *)t15) = t22;
    t23 = *((unsigned int *)t20);
    t24 = (t23 >> 3);
    *((unsigned int *)t19) = t24;
    t25 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t25 & 63U);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 & 63U);
    t27 = ((char*)((ng3)));
    xsi_vlogtype_concat(t3, 17, 17, 3U, t27, 4, t15, 6, t4, 7);
    t28 = (t0 + 7512);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memset(t32, 0, 8);
    t33 = 32767U;
    t34 = t33;
    t35 = (t3 + 4);
    t36 = *((unsigned int *)t3);
    t33 = (t33 & t36);
    t37 = *((unsigned int *)t35);
    t34 = (t34 & t37);
    t38 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t39 | t33);
    t40 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t40 | t34);
    xsi_driver_vfirst_trans(t28, 0, 14);
    t41 = (t0 + 7256);
    *((int *)t41) = 1;

LAB1:    return;
}

static void Cont_63_6(char *t0)
{
    char t3[8];
    char t4[8];
    char t16[8];
    char t28[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 6408U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng4)));
    t5 = (t0 + 3208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t4, 0, 8);
    t8 = (t4 + 4);
    t9 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 1);
    *((unsigned int *)t4) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 >> 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 3U);
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 3U);
    t17 = (t0 + 4008);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t16, 0, 8);
    t20 = (t16 + 4);
    t21 = (t19 + 4);
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t16) = t23;
    t24 = *((unsigned int *)t21);
    t25 = (t24 >> 0);
    *((unsigned int *)t20) = t25;
    t26 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t26 & 255U);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t27 & 255U);
    xsi_vlogtype_concat(t3, 15, 10, 2U, t16, 8, t4, 2);
    memset(t28, 0, 8);
    xsi_vlog_unsigned_add(t28, 15, t2, 15, t3, 15);
    t29 = (t0 + 7576);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 32767U;
    t35 = t34;
    t36 = (t28 + 4);
    t37 = *((unsigned int *)t28);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 14);
    t42 = (t0 + 7272);
    *((int *)t42) = 1;

LAB1:    return;
}

static void Always_65_7(char *t0)
{
    char t4[8];
    char t8[8];
    char t32[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    int t48;

LAB0:    t1 = (t0 + 6656U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 7288);
    *((int *)t2) = 1;
    t3 = (t0 + 6688);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(65, ng0);

LAB5:    xsi_set_current_line(67, ng0);
    t5 = (t0 + 3208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    t9 = (t8 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t9) = t16;
    memset(t4, 0, 8);
    t17 = (t8 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (~(t18));
    t20 = *((unsigned int *)t8);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t17) == 0)
        goto LAB6;

LAB8:    t23 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t23) = 1;

LAB9:    t24 = (t4 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t4);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(70, ng0);

LAB14:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 2128U);
    t5 = (t2 + 72U);
    t6 = *((char **)t5);
    t7 = (t0 + 3368);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memset(t8, 0, 8);
    t17 = (t8 + 4);
    t23 = (t10 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t23);
    t14 = (t13 >> 0);
    *((unsigned int *)t17) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 7U);
    t16 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t16 & 7U);
    xsi_vlog_generic_get_index_select_value(t4, 1, t3, t6, 2, t8, 3, 2);
    t24 = (t0 + 3848);
    xsi_vlogvar_assign_value(t24, t4, 0, 0, 1);

LAB12:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB15:    t6 = ((char*)((ng2)));
    t48 = xsi_vlog_unsigned_case_compare(t5, 2, t6, 32);
    if (t48 == 1)
        goto LAB16;

LAB17:
LAB19:
LAB18:    xsi_set_current_line(79, ng0);

LAB22:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 15);

LAB20:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(67, ng0);

LAB13:    xsi_set_current_line(68, ng0);
    t30 = (t0 + 2008U);
    t31 = *((char **)t30);
    t30 = (t0 + 1968U);
    t33 = (t30 + 72U);
    t34 = *((char **)t33);
    t36 = (t0 + 3368);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memset(t35, 0, 8);
    t39 = (t35 + 4);
    t40 = (t38 + 4);
    t41 = *((unsigned int *)t38);
    t42 = (t41 >> 0);
    *((unsigned int *)t35) = t42;
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 0);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t45 & 7U);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t46 & 7U);
    xsi_vlog_generic_get_index_select_value(t32, 1, t31, t34, 2, t35, 3, 2);
    t47 = (t0 + 3848);
    xsi_vlogvar_assign_value(t47, t32, 0, 0, 1);
    goto LAB12;

LAB16:    xsi_set_current_line(76, ng0);

LAB21:    xsi_set_current_line(77, ng0);
    t7 = (t0 + 2328U);
    t9 = *((char **)t7);
    t7 = (t0 + 3048);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 15);
    goto LAB20;

}

static void Always_85_8(char *t0)
{
    char t8[8];
    char t10[8];
    char t18[8];
    char t27[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    int t54;

LAB0:    t1 = (t0 + 6904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 7304);
    *((int *)t2) = 1;
    t3 = (t0 + 6936);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(85, ng0);

LAB5:    xsi_set_current_line(87, ng0);
    t4 = (t0 + 3528);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng5)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_lshift(t8, 31, t6, 31, t7, 32);
    t9 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 31, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t5 = (t10 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 30);
    t13 = (t12 & 1);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 30);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 3528);
    t9 = (t7 + 56U);
    t17 = *((char **)t9);
    memset(t18, 0, 8);
    t19 = (t18 + 4);
    t20 = (t17 + 4);
    t21 = *((unsigned int *)t17);
    t22 = (t21 >> 27);
    t23 = (t22 & 1);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t20);
    t25 = (t24 >> 27);
    t26 = (t25 & 1);
    *((unsigned int *)t19) = t26;
    t28 = *((unsigned int *)t10);
    t29 = *((unsigned int *)t18);
    t30 = (t28 ^ t29);
    *((unsigned int *)t27) = t30;
    t31 = (t10 + 4);
    t32 = (t18 + 4);
    t33 = (t27 + 4);
    t34 = *((unsigned int *)t31);
    t35 = *((unsigned int *)t32);
    t36 = (t34 | t35);
    *((unsigned int *)t33) = t36;
    t37 = *((unsigned int *)t33);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB6;

LAB7:
LAB8:    t42 = (t0 + 3528);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memset(t41, 0, 8);
    t45 = (t41 + 4);
    t46 = (t44 + 4);
    t47 = *((unsigned int *)t44);
    t48 = (t47 >> 0);
    *((unsigned int *)t41) = t48;
    t49 = *((unsigned int *)t46);
    t50 = (t49 >> 0);
    *((unsigned int *)t45) = t50;
    t51 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t51 & 1073741823U);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 & 1073741823U);
    xsi_vlogtype_concat(t8, 31, 31, 2U, t41, 30, t27, 1);
    t53 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t53, t8, 0, 0, 31, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 2, t4, 2, t5, 2);
    t6 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 2, 0LL);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB9;

LAB10:
LAB11:    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = ((char*)((ng8)));
    memset(t8, 0, 8);
    t7 = (t5 + 4);
    t9 = (t6 + 4);
    t11 = *((unsigned int *)t5);
    t12 = *((unsigned int *)t6);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t9);
    t16 = (t14 ^ t15);
    t21 = (t13 | t16);
    t22 = *((unsigned int *)t7);
    t23 = *((unsigned int *)t9);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB29;

LAB26:    if (t24 != 0)
        goto LAB28;

LAB27:    *((unsigned int *)t8) = 1;

LAB29:    t19 = (t8 + 4);
    t28 = *((unsigned int *)t19);
    t29 = (~(t28));
    t30 = *((unsigned int *)t8);
    t34 = (t30 & t29);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB30;

LAB31:
LAB32:    goto LAB2;

LAB6:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t27) = (t39 | t40);
    goto LAB8;

LAB9:    xsi_set_current_line(93, ng0);

LAB12:    xsi_set_current_line(94, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 9, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 10, 0LL);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);

LAB13:    t2 = ((char*)((ng2)));
    t54 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t54 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng8)));
    t54 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t54 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng5)));
    t54 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t54 == 1)
        goto LAB18;

LAB19:
LAB21:
LAB20:    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng9)));
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 8, 0LL);

LAB22:    goto LAB11;

LAB14:    xsi_set_current_line(98, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t0 + 3368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t10, 0, 8);
    t9 = (t10 + 4);
    t17 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 5);
    t13 = (t12 & 1);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t17);
    t15 = (t14 >> 5);
    t16 = (t15 & 1);
    *((unsigned int *)t9) = t16;
    t19 = (t0 + 3208);
    t20 = (t19 + 56U);
    t31 = *((char **)t20);
    memset(t18, 0, 8);
    t32 = (t18 + 4);
    t33 = (t31 + 4);
    t21 = *((unsigned int *)t31);
    t22 = (t21 >> 5);
    t23 = (t22 & 1);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t33);
    t25 = (t24 >> 5);
    t26 = (t25 & 1);
    *((unsigned int *)t32) = t26;
    t28 = *((unsigned int *)t10);
    t29 = *((unsigned int *)t18);
    t30 = (t28 ^ t29);
    *((unsigned int *)t27) = t30;
    t42 = (t10 + 4);
    t43 = (t18 + 4);
    t44 = (t27 + 4);
    t34 = *((unsigned int *)t42);
    t35 = *((unsigned int *)t43);
    t36 = (t34 | t35);
    *((unsigned int *)t44) = t36;
    t37 = *((unsigned int *)t44);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB23;

LAB24:
LAB25:    xsi_vlog_mul_concat(t8, 8, 1, t4, 1U, t27, 1);
    t45 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t45, t8, 0, 0, 8, 0LL);
    goto LAB22;

LAB16:    xsi_set_current_line(99, ng0);
    t4 = (t0 + 3528);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    t7 = (t8 + 4);
    t9 = (t6 + 4);
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 0);
    *((unsigned int *)t7) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 255U);
    t16 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t16 & 255U);
    t17 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t17, t8, 0, 0, 8, 0LL);
    goto LAB22;

LAB18:    xsi_set_current_line(100, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t0 + 3848);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    xsi_vlog_mul_concat(t8, 8, 1, t4, 1U, t7, 1);
    t9 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 8, 0LL);
    goto LAB22;

LAB23:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t44);
    *((unsigned int *)t27) = (t39 | t40);
    goto LAB25;

LAB28:    t17 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB29;

LAB30:    xsi_set_current_line(105, ng0);

LAB33:    xsi_set_current_line(106, ng0);
    t20 = (t0 + 1848U);
    t31 = *((char **)t20);
    t20 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t20, t31, 0, 0, 16, 0LL);
    goto LAB32;

}


extern void work_m_10558890325568053902_0062818904_init()
{
	static char *pe[] = {(void *)Initial_37_0,(void *)Initial_41_1,(void *)Initial_47_2,(void *)Cont_51_3,(void *)Cont_55_4,(void *)Cont_59_5,(void *)Cont_63_6,(void *)Always_65_7,(void *)Always_85_8};
	xsi_register_didat("work_m_10558890325568053902_0062818904", "isim/CoreTest_isim_beh.exe.sim/work/m_10558890325568053902_0062818904.didat");
	xsi_register_executes(pe);
}

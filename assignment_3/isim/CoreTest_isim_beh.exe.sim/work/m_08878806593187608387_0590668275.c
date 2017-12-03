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
static const char *ng0 = "/home/rajp/Projects/CPU/assignment_3/SevenSeg.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {416666, 0};
static unsigned int ng4[] = {14U, 0U};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {13U, 0U};
static int ng7[] = {2, 0};
static unsigned int ng8[] = {11U, 0U};
static unsigned int ng9[] = {7U, 0U};
static int ng10[] = {3, 0};
static unsigned int ng11[] = {192U, 0U};
static unsigned int ng12[] = {249U, 0U};
static unsigned int ng13[] = {164U, 0U};
static unsigned int ng14[] = {176U, 0U};
static int ng15[] = {4, 0};
static unsigned int ng16[] = {153U, 0U};
static int ng17[] = {5, 0};
static unsigned int ng18[] = {146U, 0U};
static int ng19[] = {6, 0};
static unsigned int ng20[] = {130U, 0U};
static int ng21[] = {7, 0};
static unsigned int ng22[] = {248U, 0U};
static int ng23[] = {8, 0};
static unsigned int ng24[] = {128U, 0U};
static int ng25[] = {9, 0};
static unsigned int ng26[] = {144U, 0U};
static int ng27[] = {10, 0};
static unsigned int ng28[] = {160U, 0U};
static int ng29[] = {11, 0};
static unsigned int ng30[] = {131U, 0U};
static int ng31[] = {12, 0};
static unsigned int ng32[] = {198U, 0U};
static int ng33[] = {13, 0};
static unsigned int ng34[] = {161U, 0U};
static int ng35[] = {14, 0};
static unsigned int ng36[] = {134U, 0U};
static int ng37[] = {15, 0};
static unsigned int ng38[] = {142U, 0U};
static unsigned int ng39[] = {191U, 0U};



static void Initial_49_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(49, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4104);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 20);

LAB1:    return;
}

static void Initial_50_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4264);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 2);

LAB1:    return;
}

static void Initial_51_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4424);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 4);

LAB1:    return;
}

static void Always_54_3(char *t0)
{
    char t8[8];
    char t32[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
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
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;

LAB0:    t1 = (t0 + 6080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 6896);
    *((int *)t2) = 1;
    t3 = (t0 + 6112);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(54, ng0);

LAB5:    xsi_set_current_line(55, ng0);
    t4 = (t0 + 4104);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 20, t6, 20, t7, 20);
    t9 = (t0 + 4104);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 20, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 4104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t6);
    t14 = *((unsigned int *)t7);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t7);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB9;

LAB6:    if (t19 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t22 = (t8 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t8);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t6);
    t14 = *((unsigned int *)t7);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t7);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB17;

LAB14:    if (t19 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t8) = 1;

LAB17:    t22 = (t8 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t8);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB18;

LAB19:
LAB20:    goto LAB2;

LAB8:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(57, ng0);

LAB13:    xsi_set_current_line(58, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 4104);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 20, 0LL);
    goto LAB12;

LAB16:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(60, ng0);

LAB21:    xsi_set_current_line(62, ng0);
    t28 = (t0 + 4264);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng2)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 2, t30, 2, t31, 2);
    t33 = (t0 + 4264);
    xsi_vlogvar_wait_assign_value(t33, t32, 0, 0, 2, 0LL);
    goto LAB20;

}

static void Cont_67_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t40[8];
    char t41[8];
    char t46[8];
    char t78[8];
    char t79[8];
    char t84[8];
    char *t1;
    char *t2;
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
    unsigned int t17;
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
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t85;
    char *t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    char *t117;
    char *t118;
    char *t119;
    char *t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    char *t130;

LAB0:    t1 = (t0 + 6328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 4264);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t117 = (t0 + 7008);
    t118 = (t117 + 56U);
    t119 = *((char **)t118);
    t120 = (t119 + 56U);
    t121 = *((char **)t120);
    memset(t121, 0, 8);
    t122 = 15U;
    t123 = t122;
    t124 = (t3 + 4);
    t125 = *((unsigned int *)t3);
    t122 = (t122 & t125);
    t126 = *((unsigned int *)t124);
    t123 = (t123 & t126);
    t127 = (t121 + 4);
    t128 = *((unsigned int *)t121);
    *((unsigned int *)t121) = (t128 | t122);
    t129 = *((unsigned int *)t127);
    *((unsigned int *)t127) = (t129 | t123);
    xsi_driver_vfirst_trans(t117, 0, 3);
    t130 = (t0 + 6912);
    *((int *)t130) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng4)));
    goto LAB13;

LAB14:    t42 = (t0 + 4264);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = ((char*)((ng5)));
    memset(t46, 0, 8);
    t47 = (t44 + 4);
    t48 = (t45 + 4);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = *((unsigned int *)t47);
    t53 = *((unsigned int *)t48);
    t54 = (t52 ^ t53);
    t55 = (t51 | t54);
    t56 = *((unsigned int *)t47);
    t57 = *((unsigned int *)t48);
    t58 = (t56 | t57);
    t59 = (~(t58));
    t60 = (t55 & t59);
    if (t60 != 0)
        goto LAB24;

LAB21:    if (t58 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t46) = 1;

LAB24:    memset(t41, 0, 8);
    t62 = (t46 + 4);
    t63 = *((unsigned int *)t62);
    t64 = (~(t63));
    t65 = *((unsigned int *)t46);
    t66 = (t65 & t64);
    t67 = (t66 & 1U);
    if (t67 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t62) != 0)
        goto LAB27;

LAB28:    t69 = (t41 + 4);
    t70 = *((unsigned int *)t41);
    t71 = *((unsigned int *)t69);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB29;

LAB30:    t74 = *((unsigned int *)t41);
    t75 = (~(t74));
    t76 = *((unsigned int *)t69);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t69) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t78, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 4, t35, 4, t40, 4);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB23:    t61 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t68 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t68) = 1;
    goto LAB28;

LAB29:    t73 = ((char*)((ng6)));
    goto LAB30;

LAB31:    t80 = (t0 + 4264);
    t81 = (t80 + 56U);
    t82 = *((char **)t81);
    t83 = ((char*)((ng7)));
    memset(t84, 0, 8);
    t85 = (t82 + 4);
    t86 = (t83 + 4);
    t87 = *((unsigned int *)t82);
    t88 = *((unsigned int *)t83);
    t89 = (t87 ^ t88);
    t90 = *((unsigned int *)t85);
    t91 = *((unsigned int *)t86);
    t92 = (t90 ^ t91);
    t93 = (t89 | t92);
    t94 = *((unsigned int *)t85);
    t95 = *((unsigned int *)t86);
    t96 = (t94 | t95);
    t97 = (~(t96));
    t98 = (t93 & t97);
    if (t98 != 0)
        goto LAB41;

LAB38:    if (t96 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t84) = 1;

LAB41:    memset(t79, 0, 8);
    t100 = (t84 + 4);
    t101 = *((unsigned int *)t100);
    t102 = (~(t101));
    t103 = *((unsigned int *)t84);
    t104 = (t103 & t102);
    t105 = (t104 & 1U);
    if (t105 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t100) != 0)
        goto LAB44;

LAB45:    t107 = (t79 + 4);
    t108 = *((unsigned int *)t79);
    t109 = *((unsigned int *)t107);
    t110 = (t108 || t109);
    if (t110 > 0)
        goto LAB46;

LAB47:    t112 = *((unsigned int *)t79);
    t113 = (~(t112));
    t114 = *((unsigned int *)t107);
    t115 = (t113 || t114);
    if (t115 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t107) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t79) > 0)
        goto LAB52;

LAB53:    memcpy(t78, t116, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 4, t73, 4, t78, 4);
    goto LAB37;

LAB35:    memcpy(t40, t73, 8);
    goto LAB37;

LAB40:    t99 = (t84 + 4);
    *((unsigned int *)t84) = 1;
    *((unsigned int *)t99) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t79) = 1;
    goto LAB45;

LAB44:    t106 = (t79 + 4);
    *((unsigned int *)t79) = 1;
    *((unsigned int *)t106) = 1;
    goto LAB45;

LAB46:    t111 = ((char*)((ng8)));
    goto LAB47;

LAB48:    t116 = ((char*)((ng9)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t78, 4, t111, 4, t116, 4);
    goto LAB54;

LAB52:    memcpy(t78, t111, 8);
    goto LAB54;

}

static void Always_72_5(char *t0)
{
    char t9[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;

LAB0:    t1 = (t0 + 6576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 6928);
    *((int *)t2) = 1;
    t3 = (t0 + 6608);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(72, ng0);

LAB5:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 4264);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB16:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 32);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng19)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng21)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng23)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng25)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng27)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng29)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng31)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng33)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng35)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng37)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t8 == 1)
        goto LAB47;

LAB48:
LAB50:
LAB49:    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng39)));
    t3 = (t0 + 3944);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);

LAB51:    goto LAB2;

LAB7:    xsi_set_current_line(76, ng0);
    t10 = (t0 + 3384U);
    t11 = *((char **)t10);
    memset(t9, 0, 8);
    t10 = (t9 + 4);
    t12 = (t11 + 4);
    t13 = *((unsigned int *)t11);
    t14 = (t13 >> 0);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 0);
    *((unsigned int *)t10) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 15U);
    t18 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t18 & 15U);
    t19 = (t0 + 4424);
    xsi_vlogvar_assign_value(t19, t9, 0, 0, 4);
    goto LAB15;

LAB9:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 3384U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t5 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 4);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t5);
    t16 = (t15 >> 4);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 15U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 15U);
    t7 = (t0 + 4424);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 4);
    goto LAB15;

LAB11:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 3384U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t5 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 8);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t5);
    t16 = (t15 >> 8);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 15U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 15U);
    t7 = (t0 + 4424);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 4);
    goto LAB15;

LAB13:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 3384U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t5 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 12);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t5);
    t16 = (t15 >> 12);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 15U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 15U);
    t7 = (t0 + 4424);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 4);
    goto LAB15;

LAB17:    xsi_set_current_line(84, ng0);
    t7 = ((char*)((ng11)));
    t10 = (t0 + 3944);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 8);
    goto LAB51;

LAB19:    xsi_set_current_line(85, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB21:    xsi_set_current_line(86, ng0);
    t3 = ((char*)((ng13)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB23:    xsi_set_current_line(87, ng0);
    t3 = ((char*)((ng14)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB25:    xsi_set_current_line(88, ng0);
    t3 = ((char*)((ng16)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB27:    xsi_set_current_line(89, ng0);
    t3 = ((char*)((ng18)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB29:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng20)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB31:    xsi_set_current_line(91, ng0);
    t3 = ((char*)((ng22)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB33:    xsi_set_current_line(92, ng0);
    t3 = ((char*)((ng24)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB35:    xsi_set_current_line(93, ng0);
    t3 = ((char*)((ng26)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB37:    xsi_set_current_line(94, ng0);
    t3 = ((char*)((ng28)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB39:    xsi_set_current_line(95, ng0);
    t3 = ((char*)((ng30)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB41:    xsi_set_current_line(96, ng0);
    t3 = ((char*)((ng32)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB43:    xsi_set_current_line(97, ng0);
    t3 = ((char*)((ng34)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB45:    xsi_set_current_line(98, ng0);
    t3 = ((char*)((ng36)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

LAB47:    xsi_set_current_line(99, ng0);
    t3 = ((char*)((ng38)));
    t5 = (t0 + 3944);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB51;

}


extern void work_m_08878806593187608387_0590668275_init()
{
	static char *pe[] = {(void *)Initial_49_0,(void *)Initial_50_1,(void *)Initial_51_2,(void *)Always_54_3,(void *)Cont_67_4,(void *)Always_72_5};
	xsi_register_didat("work_m_08878806593187608387_0590668275", "isim/CoreTest_isim_beh.exe.sim/work/m_08878806593187608387_0590668275.didat");
	xsi_register_executes(pe);
}

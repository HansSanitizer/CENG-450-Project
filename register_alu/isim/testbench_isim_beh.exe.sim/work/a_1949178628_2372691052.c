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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/jgmann/CENG450/register_alu/alu_tb.vhd";



static void work_a_1949178628_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;

LAB0:    t1 = (t0 + 3312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 4104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(40, ng0);
    t7 = (10 * 1000000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 4104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(41, ng0);
    t7 = (10 * 1000000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t7);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1949178628_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;

LAB0:    t1 = (t0 + 3560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 6623);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 6626);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 6642);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 4360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(46, ng0);

LAB6:    t2 = (t0 + 3880);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t5 = (t0 + 3880);
    *((int *)t5) = 0;
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 6658);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 6661);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 6677);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(48, ng0);

LAB13:    t2 = (t0 + 3896);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB5:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB8;

LAB9:    t9 = (unsigned char)0;

LAB10:    if (t9 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB10;

LAB11:    t5 = (t0 + 3896);
    *((int *)t5) = 0;
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 6693);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 6696);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 6712);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(50, ng0);

LAB20:    t2 = (t0 + 3912);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB12:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB15;

LAB16:    t9 = (unsigned char)0;

LAB17:    if (t9 == 1)
        goto LAB11;
    else
        goto LAB13;

LAB14:    goto LAB12;

LAB15:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB17;

LAB18:    t5 = (t0 + 3912);
    *((int *)t5) = 0;
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 6728);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 6744);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(52, ng0);

LAB27:    t2 = (t0 + 3928);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB19:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB22;

LAB23:    t9 = (unsigned char)0;

LAB24:    if (t9 == 1)
        goto LAB18;
    else
        goto LAB20;

LAB21:    goto LAB19;

LAB22:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB24;

LAB25:    t5 = (t0 + 3928);
    *((int *)t5) = 0;
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 6760);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 6763);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 6779);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(54, ng0);

LAB34:    t2 = (t0 + 3944);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB26:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB29;

LAB30:    t9 = (unsigned char)0;

LAB31:    if (t9 == 1)
        goto LAB25;
    else
        goto LAB27;

LAB28:    goto LAB26;

LAB29:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB31;

LAB32:    t5 = (t0 + 3944);
    *((int *)t5) = 0;
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 6795);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 6798);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 6814);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(56, ng0);

LAB41:    t2 = (t0 + 3960);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB33:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB36;

LAB37:    t9 = (unsigned char)0;

LAB38:    if (t9 == 1)
        goto LAB32;
    else
        goto LAB34;

LAB35:    goto LAB33;

LAB36:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB38;

LAB39:    t5 = (t0 + 3960);
    *((int *)t5) = 0;
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 6830);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 6833);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 6849);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(58, ng0);

LAB48:    t2 = (t0 + 3976);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB40:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB43;

LAB44:    t9 = (unsigned char)0;

LAB45:    if (t9 == 1)
        goto LAB39;
    else
        goto LAB41;

LAB42:    goto LAB40;

LAB43:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB45;

LAB46:    t5 = (t0 + 3976);
    *((int *)t5) = 0;
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 6865);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 6868);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 6884);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(60, ng0);

LAB55:    t2 = (t0 + 3992);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB56;
    goto LAB1;

LAB47:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB50;

LAB51:    t9 = (unsigned char)0;

LAB52:    if (t9 == 1)
        goto LAB46;
    else
        goto LAB48;

LAB49:    goto LAB47;

LAB50:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB52;

LAB53:    t5 = (t0 + 3992);
    *((int *)t5) = 0;
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 6900);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 6903);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(62, ng0);

LAB62:    t2 = (t0 + 4008);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB54:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB57;

LAB58:    t9 = (unsigned char)0;

LAB59:    if (t9 == 1)
        goto LAB53;
    else
        goto LAB55;

LAB56:    goto LAB54;

LAB57:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB59;

LAB60:    t5 = (t0 + 4008);
    *((int *)t5) = 0;
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 6919);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(64, ng0);

LAB69:    t2 = (t0 + 4024);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB70;
    goto LAB1;

LAB61:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB64;

LAB65:    t9 = (unsigned char)0;

LAB66:    if (t9 == 1)
        goto LAB60;
    else
        goto LAB62;

LAB63:    goto LAB61;

LAB64:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB66;

LAB67:    t5 = (t0 + 4024);
    *((int *)t5) = 0;
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 6935);
    t4 = (t0 + 4232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(66, ng0);

LAB76:    *((char **)t1) = &&LAB77;
    goto LAB1;

LAB68:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB71;

LAB72:    t9 = (unsigned char)0;

LAB73:    if (t9 == 1)
        goto LAB67;
    else
        goto LAB69;

LAB70:    goto LAB68;

LAB71:    t3 = (t0 + 992U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB73;

LAB74:    goto LAB2;

LAB75:    goto LAB74;

LAB77:    goto LAB75;

}


extern void work_a_1949178628_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1949178628_2372691052_p_0,(void *)work_a_1949178628_2372691052_p_1};
	xsi_register_didat("work_a_1949178628_2372691052", "isim/testbench_isim_beh.exe.sim/work/a_1949178628_2372691052.didat");
	xsi_register_executes(pe);
}

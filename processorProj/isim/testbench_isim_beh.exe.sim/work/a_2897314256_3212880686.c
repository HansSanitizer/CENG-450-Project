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
static const char *ng0 = "C:/Users/tlong/Documents/CENG-450-Project/processorProj/reg_EXE_MEM.vhd";



static void work_a_2897314256_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;

LAB0:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)2);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB13;

LAB14:    t1 = (unsigned char)0;

LAB15:    if (t1 != 0)
        goto LAB11;

LAB12:
LAB3:    t2 = (t0 + 4112);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 7U);
    xsi_driver_first_trans_delta(t2, 0U, 7U, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 7U, 3U, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 10U, 3U, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 13U, 3U, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_delta(t2, 16U, 16U, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_delta(t2, 32U, 1, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 4192);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_delta(t2, 33U, 1, 0LL);

LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB8:    xsi_set_current_line(68, ng0);
    t7 = xsi_get_transient_memory(34U);
    memset(t7, 0, 34U);
    t11 = t7;
    memset(t11, (unsigned char)2, 34U);
    t12 = (t0 + 4192);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 34U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

LAB11:    xsi_set_current_line(80, ng0);
    t7 = (t0 + 2632U);
    t8 = *((char **)t7);
    t17 = (33 - 17);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t7 = (t8 + t19);
    t11 = (t0 + 4256);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 16U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB3;

LAB13:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB15;

}


extern void work_a_2897314256_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2897314256_3212880686_p_0};
	xsi_register_didat("work_a_2897314256_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_2897314256_3212880686.didat");
	xsi_register_executes(pe);
}

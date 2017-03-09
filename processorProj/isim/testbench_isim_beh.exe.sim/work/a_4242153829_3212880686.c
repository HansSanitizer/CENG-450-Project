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
static const char *ng0 = "C:/Users/tlong/Documents/CENG-450-Project/processorProj/reg_ID_EXE.vhd";



static void work_a_4242153829_3212880686_p_0(char *t0)
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

LAB0:    xsi_set_current_line(70, ng0);
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
LAB3:    t2 = (t0 + 5072);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(72, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 7U);
    xsi_driver_first_trans_delta(t2, 0U, 7U, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 7U, 3U, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 10U, 3U, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 13U, 3U, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_delta(t2, 16U, 16U, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_delta(t2, 32U, 3U, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 5152);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_delta(t2, 35U, 16U, 0LL);

LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB8:    xsi_set_current_line(74, ng0);
    t7 = xsi_get_transient_memory(51U);
    memset(t7, 0, 51U);
    t11 = t7;
    memset(t11, (unsigned char)2, 51U);
    t12 = (t0 + 5152);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 51U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

LAB11:    xsi_set_current_line(86, ng0);
    t7 = (t0 + 3592U);
    t8 = *((char **)t7);
    t17 = (50 - 50);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t7 = (t8 + t19);
    t11 = (t0 + 5216);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 7U);
    xsi_driver_first_trans_fast_port(t11);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t17 = (50 - 43);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t3 + t19);
    t7 = (t0 + 5280);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t17 = (50 - 40);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t3 + t19);
    t7 = (t0 + 5344);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t17 = (50 - 37);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t3 + t19);
    t7 = (t0 + 5408);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t17 = (50 - 34);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t3 + t19);
    t7 = (t0 + 5472);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t17 = (50 - 18);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t3 + t19);
    t7 = (t0 + 5536);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t17 = (50 - 15);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t3 + t19);
    t7 = (t0 + 5600);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

LAB13:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB15;

}


extern void work_a_4242153829_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4242153829_3212880686_p_0};
	xsi_register_didat("work_a_4242153829_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_4242153829_3212880686.didat");
	xsi_register_executes(pe);
}

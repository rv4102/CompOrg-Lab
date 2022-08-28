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
static const char *ng0 = "A = %d, B = %d, difference = %d\n";
static const char *ng1 = "C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/RCA_jr/RCA_subtraction_TestBench.v";
static unsigned int ng2[] = {65000U, 0U, 0U, 0U};
static unsigned int ng3[] = {65340U, 0U, 0U, 0U};
static unsigned int ng4[] = {58135U, 0U, 0U, 0U};
static unsigned int ng5[] = {3592U, 0U, 0U, 0U};
static unsigned int ng6[] = {1005U, 0U, 0U, 0U};
static unsigned int ng7[] = {69U, 0U, 0U, 0U};
static unsigned int ng8[] = {15124U, 0U, 0U, 0U};
static unsigned int ng9[] = {5383U, 0U, 0U, 0U};
static unsigned int ng10[] = {50U, 0U, 0U, 0U};
static unsigned int ng11[] = {10024U, 0U, 0U, 0U};

void Monitor_26_1(char *);
void Monitor_26_1(char *);


static void Monitor_26_1_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 1608);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    xsi_vlogfile_write(1, 0, 3, ng0, 4, t0, (char)119, t3, 64, (char)119, t6, 64, (char)119, t8, 64);

LAB1:    return;
}

static void Initial_24_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng1);

LAB4:    xsi_set_current_line(26, ng1);
    Monitor_26_1(t0);
    xsi_set_current_line(29, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(29, ng1);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(30, ng1);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(31, ng1);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(31, ng1);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(32, ng1);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(33, ng1);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(33, ng1);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(34, ng1);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(35, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(35, ng1);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(36, ng1);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(37, ng1);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(37, ng1);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    goto LAB1;

}

void Monitor_26_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 2744);
    t2 = (t0 + 3256);
    xsi_vlogfile_monitor((void *)Monitor_26_1_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000001552951253_2809443161_init()
{
	static char *pe[] = {(void *)Initial_24_0,(void *)Monitor_26_1};
	xsi_register_didat("work_m_00000000001552951253_2809443161", "isim/RCA_subTB_isim_beh.exe.sim/work/m_00000000001552951253_2809443161.didat");
	xsi_register_executes(pe);
}

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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001801537340_2648124674_init();
    work_m_00000000001034788634_1743518458_init();
    work_m_00000000001175078286_3320032390_init();
    work_m_00000000001175078286_4038593053_init();
    work_m_00000000001175078286_1689017197_init();
    work_m_00000000003253471180_2845805329_init();
    work_m_00000000001552951253_2809443161_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001552951253_2809443161");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}

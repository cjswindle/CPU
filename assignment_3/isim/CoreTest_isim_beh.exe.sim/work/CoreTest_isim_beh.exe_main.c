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
    xilinxcorelib_ver_m_04284627112054182733_1933459722_init();
    xilinxcorelib_ver_m_18166792875774041790_3412580636_init();
    xilinxcorelib_ver_m_17738287534884592592_4184583857_init();
    xilinxcorelib_ver_m_10066368518302646626_2820279082_init();
    work_m_16661267567223359575_1271007809_init();
    work_m_10558890325568053902_0062818904_init();
    work_m_05904077455755997862_3082552571_init();
    work_m_08010185595124419935_1566252478_init();
    work_m_00984559603194425585_3674772129_init();
    work_m_12451524167224924052_1704550970_init();
    work_m_17740462927748096964_3508565487_init();
    work_m_06729367881340130144_1194899566_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_06729367881340130144_1194899566");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}

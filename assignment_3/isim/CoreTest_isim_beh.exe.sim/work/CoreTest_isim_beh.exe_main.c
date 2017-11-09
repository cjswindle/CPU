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
    xilinxcorelib_ver_m_00000000001358910285_1933459722_init();
    xilinxcorelib_ver_m_00000000001687936702_3412580636_init();
    xilinxcorelib_ver_m_00000000000277421008_4184583857_init();
    xilinxcorelib_ver_m_00000000001603977570_2820279082_init();
    work_m_00000000003289761879_1271007809_init();
    work_m_00000000003318407822_0062818904_init();
    work_m_00000000000884634278_3082552571_init();
    work_m_00000000003864497503_1566252478_init();
    work_m_00000000000546992369_3674772129_init();
    work_m_00000000001403131796_1704550970_init();
    work_m_00000000000795435972_3508565487_init();
    work_m_00000000000842240864_1194899566_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000842240864_1194899566");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}

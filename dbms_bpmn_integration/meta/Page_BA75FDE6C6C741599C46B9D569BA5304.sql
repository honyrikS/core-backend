--liquibase formatted sql
--changeset patcher-core:Page_BA75FDE6C6C741599C46B9D569BA5304 dbms:postgresql runOnChange:true splitStatements:false stripComments:false
select pkg_patcher.p_remove_page('BA75FDE6C6C741599C46B9D569BA5304');

INSERT INTO s_mt.t_page (ck_id, ck_parent, cr_type, cv_name, cn_order, cl_static, cv_url, ck_icon, ck_user, ct_change, cl_menu)VALUES('BA75FDE6C6C741599C46B9D569BA5304', '03D2AB0C27C348E8B0A51A1794654AC5', 2, '0b1f0f88eab64838a2b8171fde789a70', 20, 0, null, '42', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000', 1) on conflict (ck_id) do update set ck_parent = excluded.ck_parent, cr_type = excluded.cr_type, cv_name = excluded.cv_name, cn_order = excluded.cn_order, cl_static = excluded.cl_static, cv_url = excluded.cv_url, ck_icon = excluded.ck_icon, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_menu = excluded.cl_menu;
INSERT INTO s_mt.t_page_action (ck_id, ck_page, cr_type, cn_action, ck_user, ct_change)VALUES('2A6A72D3736148F1A76C94A8728DFAEE', 'BA75FDE6C6C741599C46B9D569BA5304', 'edit', 516, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-27T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cr_type = excluded.cr_type, cn_action = excluded.cn_action, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_action (ck_id, ck_page, cr_type, cn_action, ck_user, ct_change)VALUES('057CA87344C6441EA47F268B45DA16F4', 'BA75FDE6C6C741599C46B9D569BA5304', 'view', 515, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-27T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cr_type = excluded.cr_type, cn_action = excluded.cn_action, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
select pkg_patcher.p_merge_object('F3907B5F266E44C984B50077AF80C3AB', '8', null, 'SYS Integration Scenario Grid << DO NOT CHANGE', 1000080, 'IBGetScenario', 'Сценарий t_scenario', '0b1f0f88eab64838a2b8171fde789a70', 'pkg_json_integr.f_modify_scenario', 's_ibc_adm', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('3F7D990BDF0E4061BE3A29D1EF9CF87A', '19', 'F3907B5F266E44C984B50077AF80C3AB', 'Add Scenario', 5, null, 'Добавление сценария', 'daa44d84012d408c9fb2f7aa0459e772', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('FC1D2A10D6354B9D9F99EFAD1D561151', '16', 'F3907B5F266E44C984B50077AF80C3AB', 'Edit', 10, null, 'Редактирование', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('6914B0DAE79D4EB4BB28F80AD15085D7', '9', 'F3907B5F266E44C984B50077AF80C3AB', 'ck_id', 20, null, 'Имя сценария', '002ec63ccef84e759841e7a7e25e27f1', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('AD551C286F214A0B9B223F82B14597DF', '9', 'F3907B5F266E44C984B50077AF80C3AB', 'cn_action', 33, null, 'Действие', '7d54ce727dd14740a2abfb1a015e3d76', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('D0A888DB7D7344B28A1220FF583A94AD', '9', 'F3907B5F266E44C984B50077AF80C3AB', 'cv_description', 36, null, 'cv_description', 'd1dd81f5338c4d85a5ffb32a0d7aab69', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('890704788E6446BDA5EDE45B613792E0', '32', 'F3907B5F266E44C984B50077AF80C3AB', 'Add window', 136, null, 'Добавление', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7B43326999AB477DB5F5F80D323365C2', '32', 'F3907B5F266E44C984B50077AF80C3AB', 'Edit window', 236, null, 'Добавление', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('C1CC13DEA1F046A9B3DF0BB7D61C6FD3', '26', '890704788E6446BDA5EDE45B613792E0', 'ck_id', 10, null, 'Наименование ck_id', 'e0cd88534f90436da2b3b5eeae0ae340', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('31E8AEFE330F4B8E9D0546254B4E23CB', '27', '7B43326999AB477DB5F5F80D323365C2', 'cn_action', 20, null, 'Действие', '7d54ce727dd14740a2abfb1a015e3d76', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('C51E674CADD144658D3A3338E4041149', '27', '890704788E6446BDA5EDE45B613792E0', 'cn_action', 20, null, 'Действие', '7d54ce727dd14740a2abfb1a015e3d76', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('B8A0352C07B545C1A4510D50499257F3', '26', '7B43326999AB477DB5F5F80D323365C2', 'cv_description', 40, null, 'Описание', 'd1dd81f5338c4d85a5ffb32a0d7aab69', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('2EEF546C07884865B32B389D25D17DAC', '26', '890704788E6446BDA5EDE45B613792E0', 'cv_description', 40, null, 'Описание', 'd1dd81f5338c4d85a5ffb32a0d7aab69', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('C42765B15CA74B7FBFEDA73803172F05', '13EB6C08614745D58EAC04EA8E5A68E9', '7B43326999AB477DB5F5F80D323365C2', 'cc_scenario', 50, null, 'cc_scenario', '70ef3797dea84ead88a5324fa858dc44', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('F639A354969C45879CE41D70DC3137A6', '13EB6C08614745D58EAC04EA8E5A68E9', '890704788E6446BDA5EDE45B613792E0', 'cc_scenario', 50, null, 'cc_scenario', '70ef3797dea84ead88a5324fa858dc44', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('FDAA524A08CC4E01804FAE18D5DEFFE4', '19', '7B43326999AB477DB5F5F80D323365C2', 'Save Button', 150, null, 'Save Button', 'ef1415ca80804e149ceb5356efb2df97', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('CC37799015EF47B1AD6D46C6804845D5', '19', '890704788E6446BDA5EDE45B613792E0', 'Save Button', 150, null, 'Save Button', 'ef1415ca80804e149ceb5356efb2df97', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('B0EEC419D3A64E3C822D3055EA8D843D', '19', '7B43326999AB477DB5F5F80D323365C2', 'Cancel Button', 250, null, 'Cancel Button', '8fd23a27ba224ee48cdef41f72947665', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('E301C917C91A4E92BB60C4C4860E2B8D', '19', '890704788E6446BDA5EDE45B613792E0', 'Cancel Button', 250, null, 'Cancel Button', '8fd23a27ba224ee48cdef41f72947665', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('89345ED362FE41819510EDC97A3ECEB2', '3F7D990BDF0E4061BE3A29D1EF9CF87A', '1033', 'add_window', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('D8B4F1F8FE7B4CA6A2BEBDA134A57B7D', '3F7D990BDF0E4061BE3A29D1EF9CF87A', '155', '1', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('48A1980B5E1E4C3D8C552800F39D5662', 'FC1D2A10D6354B9D9F99EFAD1D561151', '1493', 'edit_window', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('4EDFC269F7594B919F99FDBFBBAC8F1F', 'F3907B5F266E44C984B50077AF80C3AB', '1600', '600', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('84FC721EFBE24183872B6898F0B97E4B', 'F3907B5F266E44C984B50077AF80C3AB', '407', 'window', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('9B7202B14D2247199CC3501A606BAC14', 'C1CC13DEA1F046A9B3DF0BB7D61C6FD3', '73', 'true', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('0669CD78914344749229E68CA13052E5', 'F3907B5F266E44C984B50077AF80C3AB', '852', 'ck_id', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('23C4B15F8D7F49189C5AA7B60AD504B6', 'C1CC13DEA1F046A9B3DF0BB7D61C6FD3', '86', 'ck_id', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('172ADDDD60514CB4B45D23CB31964ACD', '6914B0DAE79D4EB4BB28F80AD15085D7', '179', '20%', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('9C5CE6B9B7854134B469F6F0E1E69D57', '6914B0DAE79D4EB4BB28F80AD15085D7', '47', 'ck_id', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('3FADF0AAD086407B9B6D8843950C5C68', '31E8AEFE330F4B8E9D0546254B4E23CB', '85', 'cn_action', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('B3BAA9DBC9D04CCFB25E343EC04FBCF4', 'C51E674CADD144658D3A3338E4041149', '85', 'cn_action', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('132723BE39284B67ABE39E745C64626C', 'AD551C286F214A0B9B223F82B14597DF', '179', '10%', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('5F17B79126E24EAABBB8E4A40EC0F18A', 'AD551C286F214A0B9B223F82B14597DF', '47', 'cn_action', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('9B48B0C9A29B45C0B889C64E2BA26F7E', 'D0A888DB7D7344B28A1220FF583A94AD', '179', '13%', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('1613A61B234A41D8924322845CCF9E3A', 'D0A888DB7D7344B28A1220FF583A94AD', '47', 'cv_description', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('23397B80CB9541EDBC09F515B08CEB76', 'B8A0352C07B545C1A4510D50499257F3', '408', '500', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('271C60ABD20D4CA2A8FDD9D5DECC94D8', '2EEF546C07884865B32B389D25D17DAC', '408', '500', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('56B972C417DE4D09A6E1F13E206CC4F0', 'B8A0352C07B545C1A4510D50499257F3', '86', 'cv_description', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('7AD6D53F271041658C9F6E9E013AAD1F', '2EEF546C07884865B32B389D25D17DAC', '86', 'cv_description', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('2336E3D2672E4A4EA191DCCE7E26581A', 'F639A354969C45879CE41D70DC3137A6', '91E86AB387264D44921C5C2567A169FA', 'cc_scenario', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('C78CDE99A59E4021B398B424C363B668', 'C42765B15CA74B7FBFEDA73803172F05', '91E86AB387264D44921C5C2567A169FA', 'cc_scenario', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('382C7B06A2A543289B2E6D852FA54123', 'F639A354969C45879CE41D70DC3137A6', 'E69B1DC44B5A40C08D7D127A49587AF1', 'IBGetInterface', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('C12710011804463CBE1A58AE561786F7', 'C42765B15CA74B7FBFEDA73803172F05', 'E69B1DC44B5A40C08D7D127A49587AF1', 'IBGetInterface', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('55B318A72A6A475799B8025C653F53A9', '890704788E6446BDA5EDE45B613792E0', '1029', 'add_window', '-1', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('58BD47AC505B4C67BFE3FC2269B92F31', '890704788E6446BDA5EDE45B613792E0', '146', 'xlwide', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('06944F1C300F41FC81239854B1417C49', 'CC37799015EF47B1AD6D46C6804845D5', '1033', 'add_window', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('BF935B72AC5647E695CC07BDDDB45DA0', 'FDAA524A08CC4E01804FAE18D5DEFFE4', '1033', 'add_window', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('DE003D8B26AD411FB217FA6D3CF4FD3C', 'CC37799015EF47B1AD6D46C6804845D5', '140', 'onSimpleSaveWindow', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('8D7B0846300A4739B3F3802E4E41B986', 'FDAA524A08CC4E01804FAE18D5DEFFE4', '140', 'onSimpleSaveWindow', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('945B50762DDE45198BA3CA8644C827FF', '7B43326999AB477DB5F5F80D323365C2', '1029', 'edit_window', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('143676E1DB7C4824A8FA5DCC56EA1EE0', '7B43326999AB477DB5F5F80D323365C2', '146', 'xlwide', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('3550A51FC35447EDA7ABBBE5B8188001', 'B0EEC419D3A64E3C822D3055EA8D843D', '1033', 'add_window', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('15FE726493F64B87A082A10057E94459', 'E301C917C91A4E92BB60C4C4860E2B8D', '1033', 'add_window', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('12C5B43750044202891E44F8AE9B95F1', 'E301C917C91A4E92BB60C4C4860E2B8D', '140', 'onCloseWindow', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('CD017B94FD844036A2F3F682A6BAAF67', 'B0EEC419D3A64E3C822D3055EA8D843D', '140', 'onCloseWindow', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('46EB431FD2ED4710925967D1090FA07D', 'B0EEC419D3A64E3C822D3055EA8D843D', '147', '2', '-1', '2020-04-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('2198B280FA0043EC80642CC6DECC5F29', 'E301C917C91A4E92BB60C4C4860E2B8D', '147', '2', '-1', '2020-04-07T00:00:00.000+0000');
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('CF85960D8DE74DA2843FC99C496BE916', 'BA75FDE6C6C741599C46B9D569BA5304', 'F3907B5F266E44C984B50077AF80C3AB', 10, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('EB833F17BE5A43508ACD7A8525E4BB2A', 'BA75FDE6C6C741599C46B9D569BA5304', '3F7D990BDF0E4061BE3A29D1EF9CF87A', 5, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('EAE1873A7E394E0AAB224F79E27AA52A', 'BA75FDE6C6C741599C46B9D569BA5304', 'FC1D2A10D6354B9D9F99EFAD1D561151', 10, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('120430C169FD4BEEBB8689CCFB971E86', 'BA75FDE6C6C741599C46B9D569BA5304', '6914B0DAE79D4EB4BB28F80AD15085D7', 20, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('50F56B70C25F4CA4B2A0D553CED36D62', 'BA75FDE6C6C741599C46B9D569BA5304', 'AD551C286F214A0B9B223F82B14597DF', 33, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('5B51F5A93421442C944BD23100401CE2', 'BA75FDE6C6C741599C46B9D569BA5304', 'D0A888DB7D7344B28A1220FF583A94AD', 36, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('B0B7C0B6922A487E8710D3ABC8B43DC8', 'BA75FDE6C6C741599C46B9D569BA5304', '890704788E6446BDA5EDE45B613792E0', 136, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('17E06869DFAA4CFA9B01A3E1063F6602', 'BA75FDE6C6C741599C46B9D569BA5304', '7B43326999AB477DB5F5F80D323365C2', 236, 'CF85960D8DE74DA2843FC99C496BE916', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('35E70EB693794BF1A6EA37900B1778ED', 'BA75FDE6C6C741599C46B9D569BA5304', 'C1CC13DEA1F046A9B3DF0BB7D61C6FD3', 10, 'B0B7C0B6922A487E8710D3ABC8B43DC8', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('375E4EAF07C946DF9EF7842F5DD94095', 'BA75FDE6C6C741599C46B9D569BA5304', '31E8AEFE330F4B8E9D0546254B4E23CB', 20, '17E06869DFAA4CFA9B01A3E1063F6602', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('DB7ABD567322430896251C98E023FCB4', 'BA75FDE6C6C741599C46B9D569BA5304', 'C51E674CADD144658D3A3338E4041149', 20, 'B0B7C0B6922A487E8710D3ABC8B43DC8', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('CC73EEB501684E55994D083A071EC4E9', 'BA75FDE6C6C741599C46B9D569BA5304', 'B8A0352C07B545C1A4510D50499257F3', 40, '17E06869DFAA4CFA9B01A3E1063F6602', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('C3A5534C99B74692A8D97F4462FCA2C4', 'BA75FDE6C6C741599C46B9D569BA5304', '2EEF546C07884865B32B389D25D17DAC', 40, 'B0B7C0B6922A487E8710D3ABC8B43DC8', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('069967FACE6B4B229C9972D02E17605E', 'BA75FDE6C6C741599C46B9D569BA5304', 'C42765B15CA74B7FBFEDA73803172F05', 50, '17E06869DFAA4CFA9B01A3E1063F6602', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('132D08E654574D94B508DBA5CF9ECD1F', 'BA75FDE6C6C741599C46B9D569BA5304', 'F639A354969C45879CE41D70DC3137A6', 50, 'B0B7C0B6922A487E8710D3ABC8B43DC8', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('06883FF38F394B0AAADBECF0697C1873', 'BA75FDE6C6C741599C46B9D569BA5304', 'FDAA524A08CC4E01804FAE18D5DEFFE4', 150, '17E06869DFAA4CFA9B01A3E1063F6602', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('D3388B1028144CB58CF2B759803FA1EF', 'BA75FDE6C6C741599C46B9D569BA5304', 'CC37799015EF47B1AD6D46C6804845D5', 150, 'B0B7C0B6922A487E8710D3ABC8B43DC8', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('C0EA0D51E4904B8CA021F8270C105BA8', 'BA75FDE6C6C741599C46B9D569BA5304', 'B0EEC419D3A64E3C822D3055EA8D843D', 250, '17E06869DFAA4CFA9B01A3E1063F6602', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('FDA2E3098B4843BDAB3B704B6D22AF1C', 'BA75FDE6C6C741599C46B9D569BA5304', 'E301C917C91A4E92BB60C4C4860E2B8D', 250, 'B0B7C0B6922A487E8710D3ABC8B43DC8', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-07T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_localization (ck_id, ck_d_lang, cr_namespace, cv_value, ck_user, ct_change)
select t.ck_id, t.ck_d_lang, t.cr_namespace, t.cv_value, t.ck_user, t.ct_change::timestamp from (
    select 'ef1415ca80804e149ceb5356efb2df97' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Сохранить' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-11-18T00:00:00.000+0000' as ct_change
    union all
    select '0b1f0f88eab64838a2b8171fde789a70' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Сценарии' as cv_value, '-11' as ck_user, '2019-12-09T00:00:00.000+0000' as ct_change
    union all
    select '002ec63ccef84e759841e7a7e25e27f1' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Имя' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select 'd0ad23ef13f8493e996cfca8a98d0721' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Редактировать значение' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '7d54ce727dd14740a2abfb1a015e3d76' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Действие' as cv_value, '-11' as ck_user, '2019-12-11T00:00:00.000+0000' as ct_change
    union all
    select '8fd23a27ba224ee48cdef41f72947665' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Отмена' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-25T00:00:00.000+0000' as ct_change
    union all
    select 'e0cd88534f90436da2b3b5eeae0ae340' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Наименование' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-25T00:00:00.000+0000' as ct_change
    union all
    select 'd1dd81f5338c4d85a5ffb32a0d7aab69' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Описание' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-26T00:00:00.000+0000' as ct_change
    union all
    select 'daa44d84012d408c9fb2f7aa0459e772' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Добавить' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-26T00:00:00.000+0000' as ct_change
    union all
    select '70ef3797dea84ead88a5324fa858dc44' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Сценарий' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2020-04-07T00:00:00.000+0000' as ct_change
) as t 
 join s_mt.t_d_lang dl
 on t.ck_d_lang = dl.ck_id
on conflict on constraint cin_u_localization_1 do update set ck_id = excluded.ck_id, ck_d_lang = excluded.ck_d_lang, cr_namespace = excluded.cr_namespace, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;

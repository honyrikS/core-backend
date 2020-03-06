--liquibase formatted sql
--changeset patcher-core:Page_CF6B6D22EE0E4524A7FF6727BC51C0FA dbms:postgresql runOnChange:true splitStatements:false stripComments:false
select pkg_patcher.p_remove_page('CF6B6D22EE0E4524A7FF6727BC51C0FA');

INSERT INTO s_mt.t_page (ck_id, ck_parent, cr_type, cv_name, cn_order, cl_static, cv_url, ck_icon, ck_user, ct_change, cl_menu)VALUES('CF6B6D22EE0E4524A7FF6727BC51C0FA', '6230F0855D6648C9A0CDBE62ED1B1811', 2, 'a494fe3920a2493ca30f7495d0531d8b', 50, 0, null, '393', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000', 1) on conflict (ck_id) do update set ck_parent = excluded.ck_parent, cr_type = excluded.cr_type, cv_name = excluded.cv_name, cn_order = excluded.cn_order, cl_static = excluded.cl_static, cv_url = excluded.cv_url, ck_icon = excluded.ck_icon, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_menu = excluded.cl_menu;
INSERT INTO s_mt.t_page_action (ck_id, ck_page, cr_type, cn_action, ck_user, ct_change)VALUES('2381F77B86964526AB94FCE2E239C662', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', 'edit', 516, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cr_type = excluded.cr_type, cn_action = excluded.cn_action, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_action (ck_id, ck_page, cr_type, cn_action, ck_user, ct_change)VALUES('9A567449E3634BC891FA2F615104711D', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', 'view', 515, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cr_type = excluded.cr_type, cn_action = excluded.cn_action, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
select pkg_patcher.p_merge_object('9FB986B8C9714036B4DCABF98563B406', '8', null, 'SYS Token Grid << DO NOT CHANGE', 10, null, 'Токена', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object('E49CF7FB44DA4BF0892827B5529A5E6A', '19', '9FB986B8C9714036B4DCABF98563B406', 'Add Button', 10, null, 'Добавить', '122d20300ab34c02b78bd1d3945e5eeb', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('013D6DD667C14D178579F22AF6F9D917', '16', '9FB986B8C9714036B4DCABF98563B406', 'Edit button', 20, null, 'Редактирование', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7ED3E817EE0F48D0873AF2805DFFAFB7', '9', '9FB986B8C9714036B4DCABF98563B406', 'ck_token', 30, null, 'Токен', 'f78e7fcbf72f4b6188af30f7bdbf76b9', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('8CE411E347864D66827F76B8162DE10E', '11', '9FB986B8C9714036B4DCABF98563B406', 'ct_start', 40, null, 'Дата начала', '9d6f4d748a9840bf9a4821c03d687a6d', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('D3F022FA0EB3468482191619370F6EF7', '11', '9FB986B8C9714036B4DCABF98563B406', 'ct_expire', 50, null, 'Дата истечения', '8b41fb0afd42461d82129c14ecda021c', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('B4003646B6A14AA7B198F574E1B9346A', '9', '9FB986B8C9714036B4DCABF98563B406', 'ck_account', 60, null, 'Пользователь', '9cbe9222069f462795ce3fc6e6c32de5', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('271CA119AFC44FEBA35DB460DF3D0F94', '36', '9FB986B8C9714036B4DCABF98563B406', 'cl_single', 70, null, 'Одноразовый', 'cc2b46e02ccb4badbb599151372d0c67', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('90652E81AEBD41C8948796A2411EC09E', '38', 'B4003646B6A14AA7B198F574E1B9346A', 'Account Grid', 10, 'AuthShowAvailableAccount', 'Пользователи', '475df8abd8ab48bca973e33dd21be33b', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('B26D7860EA1D4C6492D3F97914DC9D23', '58', '90652E81AEBD41C8948796A2411EC09E', 'Filter', 10, null, 'Filter', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('0168FBBF4FE24C198331291B9C5F5158', '9', '90652E81AEBD41C8948796A2411EC09E', 'cv_login', 20, null, 'Логин', '060a6513dc574996853d045276217394', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('20274ECFEC524CF9898E50FDB08A4ED7', '9', '90652E81AEBD41C8948796A2411EC09E', 'cv_surname', 30, null, 'Фамилия', '1e66498e8a4e48549fd83ff4b6f34af5', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('5C98E6C2B9DA4220BA7B1D979D3F703F', '9', '90652E81AEBD41C8948796A2411EC09E', 'cv_name', 40, null, 'Имя', '079a71832c164e49a909d1b3c385807c', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('8DE13342932F43B0B466F1BBC6ED8298', '9', '90652E81AEBD41C8948796A2411EC09E', 'cv_patronymic', 50, null, 'Отчество', '582a74824299435ca3019cee4a816000', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('5D2AEF6D0E8145F39A6C6A847F02057A', '26', 'B26D7860EA1D4C6492D3F97914DC9D23', 'cv_login', 10, null, 'Логин', '060a6513dc574996853d045276217394', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('6950E27D07EC4E7AB54BF6B14B73724B', '26', 'B26D7860EA1D4C6492D3F97914DC9D23', 'cv_surname', 20, null, 'Фамилия', '1e66498e8a4e48549fd83ff4b6f34af5', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('859087BB293E47959D341755468951F9', '26', 'B26D7860EA1D4C6492D3F97914DC9D23', 'cv_name', 30, null, 'Имя', '002ec63ccef84e759841e7a7e25e27f1', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object('6E9FA50D89424358B446DFD899C2601B', '26', 'B26D7860EA1D4C6492D3F97914DC9D23', 'cv_patronymic', 40, null, 'Отчество', '03b8450f205b45c9bd4714a7d74ba999', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('9730CC6FCAFA47CA9F21FFB251FA59EC', '5D2AEF6D0E8145F39A6C6A847F02057A', '1054', '25%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('C1611A761BE64B6D8B362409ED1AD548', 'E49CF7FB44DA4BF0892827B5529A5E6A', '155', '1', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('61C31B21D73346B2B8DC933A964DCB45', '9FB986B8C9714036B4DCABF98563B406', '401', '20', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('32366A2C4397491FBFDF62640661C9F1', '9FB986B8C9714036B4DCABF98563B406', '407', 'modalwindow', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('DD480D71746D41E39C233F6FAD84ECF1', '9FB986B8C9714036B4DCABF98563B406', '852', 'ck_id', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('BC33E19E3C8449B88328CF0BC302A58C', '5D2AEF6D0E8145F39A6C6A847F02057A', '86', 'cv_login', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('862B7591D4CF4002A4285E29578ECF77', '6950E27D07EC4E7AB54BF6B14B73724B', '1054', '25%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('019B9058042A4CEDB69857E9146668EB', '0168FBBF4FE24C198331291B9C5F5158', '47', 'cv_login', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('C9027264C22B4C9BAFD2BFE7A576C772', '6950E27D07EC4E7AB54BF6B14B73724B', '86', 'cv_surname', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('5E757E3A763C4B83885E14A7C7768D24', '859087BB293E47959D341755468951F9', '1054', '25%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('06CD046DD0FE40F29CBDA605177F7747', '7ED3E817EE0F48D0873AF2805DFFAFB7', '433', 'disabled', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('C4D05FC548D94CC3B2EE10553C7ABA3A', '20274ECFEC524CF9898E50FDB08A4ED7', '47', 'cv_surname', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('8F0E1B8ED56F4319AE71D06CFDC57D3D', '859087BB293E47959D341755468951F9', '86', 'cv_name', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('994D983D1E9D429384990ABBDABF61A8', '6E9FA50D89424358B446DFD899C2601B', '1054', '25%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('1E76FC2B6DA94A35A8B68AB9D1C1A5AB', '8CE411E347864D66827F76B8162DE10E', '191', '6', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('F79E621C326045AAB332F1341F0FDE22', '8CE411E347864D66827F76B8162DE10E', '441', 'insert', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('B3AEA1A69CA0468D8FA47BA49A29CEA1', '8CE411E347864D66827F76B8162DE10E', '456', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('EFD2E53AE03A4C5A94A95FEA4CBF9BA3', '5C98E6C2B9DA4220BA7B1D979D3F703F', '47', 'cv_name', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('CEF9B518E5E04381A09E2E2DD6D1B735', '8CE411E347864D66827F76B8162DE10E', '49', 'ct_start', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('DA1A026168ED49D48243D67834A0C92F', 'D3F022FA0EB3468482191619370F6EF7', '191', '6', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('39C0DF7B3350462EA4139EC6D5D5CF48', 'D3F022FA0EB3468482191619370F6EF7', '456', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-06T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('6BE37C54C1BA4FC68F0FE86CFB95DF9E', '8DE13342932F43B0B466F1BBC6ED8298', '47', 'cv_patronymic', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('A8E383C16FFB45DF88F3E9E446EE24F3', 'D3F022FA0EB3468482191619370F6EF7', '49', 'ct_expire', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('831B9CA0DBC241D4BBC4463829DCFE0B', 'B4003646B6A14AA7B198F574E1B9346A', '433', 'insert', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('88A599F29C104BCC88D12D630EF26248', 'B4003646B6A14AA7B198F574E1B9346A', '453', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('14EC1462259F4C519E4D357070FD3046', 'B4003646B6A14AA7B198F574E1B9346A', '47', 'ck_account', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('6EDC82CCBD514B418AA9F55ED54EDE26', '271CA119AFC44FEBA35DB460DF3D0F94', '1330', '1', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('928F3D26E49A4617966F43BA8DD0FAB4', '271CA119AFC44FEBA35DB460DF3D0F94', '250', 'cl_single', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('B4CA4893F3B54CFB9736D076C78F2C03', '271CA119AFC44FEBA35DB460DF3D0F94', '252', '15%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('BD65C6188B864C129FF2230B78125B2B', '271CA119AFC44FEBA35DB460DF3D0F94', '641', 'insert', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000');
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('0D72DDB9184740ACAC46EB8949AECF86', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '9FB986B8C9714036B4DCABF98563B406', 10, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('B5AE752281824E49836CDAD6127435EF', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', 'E49CF7FB44DA4BF0892827B5529A5E6A', 10, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('8CAD16FEE6944ABE9FC5A455737FDFC4', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '013D6DD667C14D178579F22AF6F9D917', 20, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('066AB6A26F0A418F97C8346F50B44B8B', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '7ED3E817EE0F48D0873AF2805DFFAFB7', 30, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('824490FA43D84591B01CFC359C722AD7', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '8CE411E347864D66827F76B8162DE10E', 40, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('6C9FEF9F3EB446DDB3F852CB7DE7A9DC', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', 'D3F022FA0EB3468482191619370F6EF7', 50, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('A9D37FDCE1EE449D980CD9DE13D97065', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', 'B4003646B6A14AA7B198F574E1B9346A', 60, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('7F92BB1951FE47358AD35911DDB9FEE0', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '271CA119AFC44FEBA35DB460DF3D0F94', 70, '0D72DDB9184740ACAC46EB8949AECF86', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('168A666686A64D7E8F2DC30F9CD27CDF', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '90652E81AEBD41C8948796A2411EC09E', 10, 'A9D37FDCE1EE449D980CD9DE13D97065', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('A1C6AB3483504CF1AFF5A2EE0B939D0F', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', 'B26D7860EA1D4C6492D3F97914DC9D23', 10, '168A666686A64D7E8F2DC30F9CD27CDF', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('1BE6FBEF4BA746E7938278FD788B7573', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '0168FBBF4FE24C198331291B9C5F5158', 20, '168A666686A64D7E8F2DC30F9CD27CDF', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('10175BFD939B4BB594D838FC09ACC03A', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '20274ECFEC524CF9898E50FDB08A4ED7', 30, '168A666686A64D7E8F2DC30F9CD27CDF', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('0D599E9001644EEC8480F6873BC382BF', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '5C98E6C2B9DA4220BA7B1D979D3F703F', 40, '168A666686A64D7E8F2DC30F9CD27CDF', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('B7B48ED4A5814DACAF16E66B7333ED71', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '8DE13342932F43B0B466F1BBC6ED8298', 50, '168A666686A64D7E8F2DC30F9CD27CDF', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('2103548366A741A18D6DF604039190EC', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '5D2AEF6D0E8145F39A6C6A847F02057A', 10, 'A1C6AB3483504CF1AFF5A2EE0B939D0F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('233486C31A7A40A7B463390EB2458FF7', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '6950E27D07EC4E7AB54BF6B14B73724B', 20, 'A1C6AB3483504CF1AFF5A2EE0B939D0F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('0A2A156AA4264533BDCDEC70655F701F', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '859087BB293E47959D341755468951F9', 30, 'A1C6AB3483504CF1AFF5A2EE0B939D0F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('22171193729C4E3BB58FB333911A8CFA', 'CF6B6D22EE0E4524A7FF6727BC51C0FA', '6E9FA50D89424358B446DFD899C2601B', 40, 'A1C6AB3483504CF1AFF5A2EE0B939D0F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-03-05T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_localization (ck_id, ck_d_lang, cr_namespace, cv_value, ck_user, ct_change)
select t.ck_id, t.ck_d_lang, t.cr_namespace, t.cv_value, t.ck_user, t.ct_change::timestamp from (
    select '002ec63ccef84e759841e7a7e25e27f1' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Имя' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '03b8450f205b45c9bd4714a7d74ba999' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Отчество' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '060a6513dc574996853d045276217394' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Логин' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '079a71832c164e49a909d1b3c385807c' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Имя' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '1e66498e8a4e48549fd83ff4b6f34af5' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Фамилия' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '475df8abd8ab48bca973e33dd21be33b' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Пользователи' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '582a74824299435ca3019cee4a816000' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Отчество' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '8b41fb0afd42461d82129c14ecda021c' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Дата истечения' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select 'd0ad23ef13f8493e996cfca8a98d0721' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Редактировать значение' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '9d6f4d748a9840bf9a4821c03d687a6d' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Дата начала' as cv_value, '-11' as ck_user, '2019-12-11T00:00:00.000+0000' as ct_change
    union all
    select '122d20300ab34c02b78bd1d3945e5eeb' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Добавить' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-25T00:00:00.000+0000' as ct_change
    union all
    select 'f78e7fcbf72f4b6188af30f7bdbf76b9' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Токен' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2020-03-05T00:00:00.000+0000' as ct_change
    union all
    select 'cc2b46e02ccb4badbb599151372d0c67' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Одноразовый' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2020-03-05T00:00:00.000+0000' as ct_change
    union all
    select 'a494fe3920a2493ca30f7495d0531d8b' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Токены' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2020-03-05T00:00:00.000+0000' as ct_change
    union all
    select '9cbe9222069f462795ce3fc6e6c32de5' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Пользователь' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2020-03-05T00:00:00.000+0000' as ct_change
) as t 
 join s_mt.t_d_lang dl
 on t.ck_d_lang = dl.ck_id
on conflict on constraint cin_u_localization_1 do update set ck_id = excluded.ck_id, ck_d_lang = excluded.ck_d_lang, cr_namespace = excluded.cr_namespace, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;

--liquibase formatted sql
--changeset patcher-core:Page_268357780361 dbms:postgresql runOnChange:true splitStatements:false stripComments:false
select pkg_patcher.p_remove_page('268357780361');

INSERT INTO s_mt.t_page (ck_id, ck_parent, cr_type, cv_name, cn_order, cl_static, cv_url, ck_icon, ck_user, ct_change, cl_menu)VALUES('268357780361', '302', 2, '87e9b00d960d4b3e8cdab0ba7b9abb64', 20, 0, null, '306', '20780', '2018-12-16T00:00:00.000+0000', 1) on conflict (ck_id) do update set ck_parent = excluded.ck_parent, cr_type = excluded.cr_type, cv_name = excluded.cv_name, cn_order = excluded.cn_order, cl_static = excluded.cl_static, cv_url = excluded.cv_url, ck_icon = excluded.ck_icon, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_menu = excluded.cl_menu;
select pkg_patcher.p_merge_page_action('342988767', '268357780361', 'edit', 705, '20780', '2018-12-16T00:00:00.000+0000');
select pkg_patcher.p_merge_page_action('342646497', '268357780361', 'view', 704, '20780', '2018-12-16T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7B511D868B5D954CE053809BA8C098D7', '8', null, 'SYS Settings', 1003010, 'MTGetSysSettings', 't_sys_setting', 'c3a995950b0847ab9707dfc8eea248c5', 'pkg_json_meta.f_modify_sys_setting', 'meta', '20788', '2018-11-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7B6855FFD50E052EE053809BA8C0CCCE', '16', '7B511D868B5D954CE053809BA8C098D7', 'column edit', 5, null, 'column edit', null, null, null, '20788', '2018-11-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7B516907E04995DBE053809BA8C0143F', '9', '7B511D868B5D954CE053809BA8C098D7', 'ck_id', 10, null, 'ck_id', '079a71832c164e49a909d1b3c385807c', null, null, '20788', '2018-12-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7B67FE4A449B95A4E053809BA8C0EF74', '9', '7B511D868B5D954CE053809BA8C098D7', 'cv_value', 20, null, 'cv_value', '22bf1c823d4545c6b2c10efb1e1b3a61', null, null, '20788', '2018-12-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7C81353E4D1B19FAE053809BA8C08693', '9', '7B511D868B5D954CE053809BA8C098D7', 'cv_description', 30, null, 'cv_description', 'd1dd81f5338c4d85a5ffb32a0d7aab69', null, null, '20788', '2018-12-07T00:00:00.000+0000');
select pkg_patcher.p_merge_object('A2FD8A840F384459AE67A7A433575705', '37', '7B67FE4A449B95A4E053809BA8C0EF74', 'Pages', 10, 'MTPage', 'Модуль/Каталоги/Страницы', 'ad5a456a8b5a4781afcc678dfb5194f3', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:44:53.079+0000');
select pkg_patcher.p_merge_object('EC287028A5954998ADC33C9E7A18DA29', '26', '7B67FE4A449B95A4E053809BA8C0EF74', 'cv_value', 100, null, 'cv_value', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:48:41.923+0000');
select pkg_patcher.p_merge_object('33C85ECAFFF240459774867A70344401', '437', 'A2FD8A840F384459AE67A7A433575705', 'Checkbox', 10, null, 'Checkbox', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:45:45.752+0000');
select pkg_patcher.p_merge_object('9588101A67F24EBB85FFFD75C2537648', '17', 'A2FD8A840F384459AE67A7A433575705', 'cv_name', 20, null, 'Наименование', '114687c48dd3443c8bfd0f8c50c185b4', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:45:52.269+0000');
select pkg_patcher.p_merge_object('3151EF8190D54B71BF9B1000B490D5B8', '77', 'A2FD8A840F384459AE67A7A433575705', 'cn_order', 30, null, 'Порядок', '067f1f2501c64e748189aabb11897e87', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:46:02.311+0000');
select pkg_patcher.p_merge_object_attr('33681260521', '7B511D868B5D954CE053809BA8C098D7', '1643', 'false', '20788', '2018-11-25T00:00:00.000+0000', 'btndelete');
select pkg_patcher.p_merge_object_attr('78563296821', '7B516907E04995DBE053809BA8C0143F', '179', '25%', '20788', '2018-12-07T00:00:00.000+0000', 'width');
select pkg_patcher.p_merge_object_attr('5468ABFE83DF4C81AB7A13B5ED9A317E', 'A2FD8A840F384459AE67A7A433575705', '261', 'cv_value', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:45:07.297+0000', 'column');
select pkg_patcher.p_merge_object_attr('33692472621', '7B516907E04995DBE053809BA8C0143F', '433', 'hidden', '20788', '2018-11-25T00:00:00.000+0000', 'editmode');
select pkg_patcher.p_merge_object_attr('22435524221', '7B516907E04995DBE053809BA8C0143F', '47', 'ck_id', '20788', '2018-11-23T00:00:00.000+0000', 'column');
select pkg_patcher.p_merge_object_attr('22457948421', '7B511D868B5D954CE053809BA8C098D7', '852', 'ck_id', '20788', '2018-11-23T00:00:00.000+0000', 'orderproperty');
select pkg_patcher.p_merge_object_attr('BB71B54F2E72493A9D6B471A7E009EE5', 'A2FD8A840F384459AE67A7A433575705', '859', 'cn_order', '-1', '2020-08-05T08:44:17.388+0000', 'orderproperty');
select pkg_patcher.p_merge_object_attr('2BFBA22165C84D9BA3D040E0660EBDC1', 'A2FD8A840F384459AE67A7A433575705', 'DE8BD5C9509F4AFB8B1DC77ED22882DC', 'array', '-1', '2020-08-05T08:44:17.388+0000', 'collectionvalues');
select pkg_patcher.p_merge_object_attr('78574508921', '7B67FE4A449B95A4E053809BA8C0EF74', '179', '25%', '20788', '2018-12-07T00:00:00.000+0000', 'width');
select pkg_patcher.p_merge_object_attr('45E4862E96224F6FA619A711B8F4C0DD', '9588101A67F24EBB85FFFD75C2537648', '2245E03AC24B477DA148AEC5B7DF3128', 'meta', '-1', '2020-08-05T08:44:17.388+0000', 'localization');
select pkg_patcher.p_merge_object_attr('22446736321', '7B67FE4A449B95A4E053809BA8C0EF74', '47', 'cv_value', '20788', '2018-11-23T00:00:00.000+0000', 'column');
select pkg_patcher.p_merge_object_attr('2A68FF8DE5EA4042B2934F8FCB51B582', '9588101A67F24EBB85FFFD75C2537648', '52', 'cv_name', '-1', '2020-08-05T08:44:17.388+0000', 'column');
select pkg_patcher.p_merge_object_attr('78585721021', '7C81353E4D1B19FAE053809BA8C08693', '179', '50%', '20788', '2018-12-07T00:00:00.000+0000', 'width');
select pkg_patcher.p_merge_object_attr('0C9C455AC0D1480BA5B8582059CD3655', '3151EF8190D54B71BF9B1000B490D5B8', '444', 'cn_order', '-1', '2020-08-05T08:44:17.388+0000', 'column');
select pkg_patcher.p_merge_object_attr('78552084721', '7C81353E4D1B19FAE053809BA8C08693', '47', 'cv_description', '20788', '2018-12-07T00:00:00.000+0000', 'column');
select pkg_patcher.p_merge_object_attr('86093473ABC743E791B38D3A8E75235F', 'EC287028A5954998ADC33C9E7A18DA29', '408', '4000', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:48:58.380+0000', 'maxsize');
select pkg_patcher.p_merge_object_attr('2F92CFEC5B8F4A658FC4351164F92180', 'EC287028A5954998ADC33C9E7A18DA29', '86', 'cv_value', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:48:48.981+0000', 'column');
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('BF431C13ECC64937A689B5F6AEB64315', '268357780361', '7B511D868B5D954CE053809BA8C098D7', 10, null, null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('8E73DD3E93A542D3B48EBB27CE6A4CED', '268357780361', '7B6855FFD50E052EE053809BA8C0CCCE', 5, 'BF431C13ECC64937A689B5F6AEB64315', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('FAB62FC7E61F4493933798864A1B3B45', '268357780361', '7B516907E04995DBE053809BA8C0143F', 10, 'BF431C13ECC64937A689B5F6AEB64315', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('0B0838EF30E746CDACA5F2D43AECBB30', '268357780361', '7B67FE4A449B95A4E053809BA8C0EF74', 20, 'BF431C13ECC64937A689B5F6AEB64315', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('C8180609D5EC4AB7A834BD7DFFA6C06A', '268357780361', '7C81353E4D1B19FAE053809BA8C08693', 30, 'BF431C13ECC64937A689B5F6AEB64315', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('845E16D61FAA406DBAF2CBACDFF74CFB', '268357780361', 'A2FD8A840F384459AE67A7A433575705', 10, '0B0838EF30E746CDACA5F2D43AECBB30', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('CDD16D2B7B2148E0952B9B6F286A54AA', '268357780361', 'EC287028A5954998ADC33C9E7A18DA29', 100, '0B0838EF30E746CDACA5F2D43AECBB30', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('898D4688292E4A2390D7D0EBBDFE7AF7', '268357780361', '33C85ECAFFF240459774867A70344401', 10, '845E16D61FAA406DBAF2CBACDFF74CFB', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('F9866747436E4B798EFC29B78A9F4ECC', '268357780361', '9588101A67F24EBB85FFFD75C2537648', 20, '845E16D61FAA406DBAF2CBACDFF74CFB', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('828989886D42427E9A47799CB14A107B', '268357780361', '3151EF8190D54B71BF9B1000B490D5B8', 30, '845E16D61FAA406DBAF2CBACDFF74CFB', null, '20848', '2018-12-16T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
select pkg_patcher.p_merge_page_object_attr('4AB1482B06804A2683391F94A9F11564', '845E16D61FAA406DBAF2CBACDFF74CFB', 'AEF0F01160E347CCB07748609793643D', 'ck_id=="skip_update_action_page"', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-05T08:47:17.258+0000', 'activerules');
INSERT INTO s_mt.t_localization (ck_id, ck_d_lang, cr_namespace, cv_value, ck_user, ct_change)
select t.ck_id, t.ck_d_lang, t.cr_namespace, t.cv_value, t.ck_user, t.ct_change::timestamp from (
    select '067f1f2501c64e748189aabb11897e87' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Порядок' as cv_value, '-11' as ck_user, '2019-12-09T00:00:00.000+0000' as ct_change
    union all
    select '079a71832c164e49a909d1b3c385807c' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Имя' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '22bf1c823d4545c6b2c10efb1e1b3a61' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Значение' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select '87e9b00d960d4b3e8cdab0ba7b9abb64' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Системные настройки' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select 'c3a995950b0847ab9707dfc8eea248c5' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Системные настройки экземпляра CORE' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select 'd0ad23ef13f8493e996cfca8a98d0721' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Редактировать значение' as cv_value, '-11' as ck_user, '2019-12-10T00:00:00.000+0000' as ct_change
    union all
    select 'ad5a456a8b5a4781afcc678dfb5194f3' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Модуль/Каталоги/Страницы' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-18T00:00:00.000+0000' as ct_change
    union all
    select '114687c48dd3443c8bfd0f8c50c185b4' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Наименование' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-26T00:00:00.000+0000' as ct_change
    union all
    select 'd1dd81f5338c4d85a5ffb32a0d7aab69' as ck_id, 'ru_RU' as ck_d_lang, 'meta' as cr_namespace, 'Описание' as cv_value, '4fd05ca9-3a9e-4d66-82df-886dfa082113' as ck_user, '2019-12-26T00:00:00.000+0000' as ct_change
) as t 
 join s_mt.t_d_lang dl
 on t.ck_d_lang = dl.ck_id
on conflict on constraint cin_u_localization_1 do update set ck_id = excluded.ck_id, ck_d_lang = excluded.ck_d_lang, cr_namespace = excluded.cr_namespace, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;

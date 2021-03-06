<?php
// Heading
$_['heading_title']         = 'Связанные опции';
$_['related_options']       = 'Связанные опции'; 

// Text
$_['text_module']           = 'Модули';
$_['text_success']          = 'Настройки обновлены!';
$_['text_content_top']      = 'Верх страницы';
$_['text_content_bottom']   = 'Низ страницы';
$_['text_column_left']      = 'Левая колонка';
$_['text_column_right']     = 'Правая колонка';
$_['text_ro_updated_to']    = 'Модуль обновлен до версии ';
$_['text_ro_all_options']   = 'Все доступные опции';
$_['text_ro_support']       = "Разработка: <a href='http://19th19th.ru' target='_blank'>19th19th.ru</a> | Поддержка, вопросы и предложения: <a href=\"mailto:opencart@19th19th.ru\">opencart@19th19th.ru</a>";
$_['text_ro_clear_options'] = 'Очистить параметры';



// Entry
$_['entry_update_quantity']           = 'Пересчитывать количество';
$_['entry_update_quantity_help']      = 'автоматически пересчитываеть количество товара на основании данных по связанным опциям';
$_['entry_stock_control']             = 'Контролировать остаток';
$_['entry_stock_control_help']        = 'запретить добавлять в корзину товар в количестве превышающем остаток по связанным опциям';
$_['entry_update_options']            = 'Обновлять опции';
$_['entry_update_options_help']    	  = 'автоматически обновлять опции товара на основании данных по связанным опциям';
$_['entry_options_values']            = 'Значения опций';
$_['entry_add_related_options']       = 'Добавить связанные опции';
$_['entry_related_options_quantity']  = 'Количество';
$_['entry_ro_version']                = 'Связанные опции, версия';

$_['entry_settings']                  = 'Настройки модуля';
$_['entry_PHPExcel_not_found']        = 'Не установлена библиотека PHPExcel. Не найден файл: ';
$_['entry_export']                    = 'Экспорт';
$_['entry_export_description']        = 'Данные выгружаются в формате XLS.<br>В первой строке таблицы содержатся заголовки, в последующих строках данные';
$_['entry_export_get_file']           = 'Получить файл';
$_['entry_export_fields']             = 'Выгружаемые данные:';
$_['entry_import']                    = 'Импорт';
$_['entry_import_description']        = '<b>Перед импортом связанных опций, все ранее введенные связанные опции будут удалены.</b>
<br><br>Формат файла: XLS. Данные берутся с первого листа.
<br>В первой строке таблицы должны быть заголовки вида: product_id, relatedoptions_model, quantity, price, option_id1, option_value_id1, option_id2, option_value_id2, ... (не путать с product_option_id и product_option_value_id)
<br>Начиная со второй строки таблицы должны быть данные соответствующие заголовкам';
$_['button_upload']		                = 'Загрузить файл';
$_['button_upload_help']              = 'загрузка начнется сразу после выбора файла';
$_['entry_server_response']           = 'Ответ сервера';
$_['entry_import_result']             = 'Обработано товаров/связанных опций';

$_['entry_ro_use_variants']           = 'Использовать различные варианты связанных опций';
$_['entry_ro_variant']                = 'Вариант связанных опций';
$_['entry_ro_variant_name']           = 'Название варианта';
$_['entry_ro_options']                = 'Опции варианта';
$_['entry_ro_add_variant']            = 'Добавить вариант';
$_['entry_ro_delete_variant']         = 'Удалить вариант';
$_['entry_ro_add_option']             = 'Добавить опцию';
$_['entry_ro_delete_option']          = 'Удалить опцию';
$_['entry_ro_use']                    = 'Использовать связанные опции';
$_['entry_show_clear_options']        = 'Показать "Очистить параметры"';
$_['entry_show_clear_options_help']   = 'отображать у покупателя кнопку для сброса выбранных значений опций товара';
$_['option_show_clear_options_not']   = 'не использовать';
$_['option_show_clear_options_top']   = 'выше опций';
$_['option_show_clear_options_bot']   = 'ниже опций';
$_['entry_hide_inaccessible']         = 'Скрывать недоступные значения';
$_['entry_hide_inaccessible_help']    = 'скрывать от покупателя недоступные для выбора значения опций';
$_['entry_spec_model']                = 'Модели в связанных опциях';
$_['entry_spec_model_help']           = 'указывать разные модели для наборов связанных опций (указанные модели будут отображаться в корзине и сохраняться в заказе)';
$_['entry_spec_price']                = 'Цены в связанных опциях';
$_['entry_spec_price_help']           = 'указывать разные цены для наборов связанных опций, если цена для набора связанных опций не заполнена - используется обычная цена товара';
$_['entry_spec_price_discount']       = 'Скидки в связанных опциях';
$_['entry_spec_price_discount_help']  = 'указывать разные скидки для наборов связанных опций (работает только вместе c включенной функцией "'.$_['entry_spec_price'].'"), если скидки для набора связанных опций не заполнены - используются обычные скидки товара';
$_['entry_add_discount']              = 'Добавить скидку';
$_['entry_del_discount_title']        = 'Удалить скидку';
$_['entry_prices']                    = 'Цены';
$_['entry_select_first_short']        = 'Автовыбор';
$_['entry_select_first_priority']     = 'Приоритет';
$_['entry_select_first']              = 'Автовыбор первого сочетания';
$_['entry_select_first_help']         = 'автоматически выбирать доступное для покупки сочетание связанных опций при открытии страницы товара, если в настройках связанных опций для товара не указаны предпочтительные сочетания опций (Автовыбор), то будет использовано первое попавшееся сочетание';
$_['entry_step_by_step']              = 'Пошаговый выбор опций';
$_['entry_step_by_step_help']         = 'покупатель сначала выбирает значение первой опции, потом второй, затем третьей и т.д. (в любой момент покупатель может начать выбор сначала, или перевыбрать значение одной из выбранных опций - неподходящие значения последующих опций будут сброшены)';
$_['entry_allow_zero_select']         = 'Выбор сочетаний без остатка';
$_['entry_allow_zero_select_help']    = 'позволить покупателю выбирать сочетания опций с нулевым остатком';
$_['entry_edit_columns']              = 'Редактирование опций';
$_['entry_edit_columns_0']            = '1 колонка';
$_['entry_edit_columns_2']            = '2 колонки';
$_['entry_edit_columns_3']            = '3 колонки';
$_['entry_edit_columns_4']            = '4 колонки';
$_['entry_edit_columns_5']            = '5 колонок';
$_['entry_edit_columns_100']          = 'по ширине';
$_['entry_edit_columns_help']         = 'расположение полей выбора опций при редактировании связанных опций';




//warning
$_['warning_equal_options']    = 'совпадающий набор опций';


// Error
$_['error_equal_options']         = 'не должно быть совпадающих наборов связанных опций';
$_['error_not_enough_options']    = 'В наборе опций заданы не все опции';
$_['error_permission']            = 'У Вас нет прав для доступа к модулю!';
?>
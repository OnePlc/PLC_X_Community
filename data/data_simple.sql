--
-- Discipline Base Form Fields
--

INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `default_value`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_list`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'text', 'Coords LAT', '', 'coords_lat', 'bookmark-base', 'bookmark-single', 'col-md-3', '/bookmark/view/##ID##', '', 0, 1, 0, '', '', ''),
(NULL, 'text', 'Coords LONG', '', 'coords_long', 'bookmark-base', 'bookmark-single', 'col-md-3', '/bookmark/view/##ID##', '', 0, 1, 0, '', '', ''),
(NULL, 'textarea', 'Description', '', 'description', 'bookmark-base', 'bookmark-single', 'col-md-12', '', '', 0, 1, 0, '', '', ''),
(NULL, 'multiselect', 'Categories', '', 'category', 'bookmark-base', 'bookmark-single', 'col-md-6', '', '/tag/api/list/bookmark-single/category', 0, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable','add-OnePlace\\Bookmark\\Controller\\CategoryController'),

COMMIT;

UPDATE `core_form_field` SET `tag_key` = 'category' WHERE `core_form_field`.`fieldkey` LIKE 'category' AND `core_form_field`.`form` LIKE 'bookmark-single';
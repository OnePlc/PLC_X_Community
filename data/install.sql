--
-- Base Table
--
CREATE TABLE `community` (
  `Community_ID` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `community`
  ADD PRIMARY KEY (`Community_ID`);

ALTER TABLE `community`
  MODIFY `Community_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Permissions
--
INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Community\\Controller\\CommunityController', 'Add', '', '', 0),
('edit', 'OnePlace\\Community\\Controller\\CommunityController', 'Edit', '', '', 0),
('index', 'OnePlace\\Community\\Controller\\CommunityController', 'Index', 'Communitys', '/community', 1),
('list', 'OnePlace\\Community\\Controller\\ApiController', 'List', '', '', 1),
('view', 'OnePlace\\Community\\Controller\\CommunityController', 'View', '', '', 0),
('dump', 'OnePlace\\Community\\Controller\\ExportController', 'Excel Dump', '', '', 0),
('index', 'OnePlace\\Community\\Controller\\SearchController', 'Search', '', '', 0);

--
-- Form
--
INSERT INTO `core_form` (`form_key`, `label`, `entity_class`, `entity_tbl_class`) VALUES
('community-single', 'Community', 'OnePlace\\Community\\Model\\Community', 'OnePlace\\Community\\Model\\CommunityTable');

--
-- Index List
--
INSERT INTO `core_index_table` (`table_name`, `form`, `label`) VALUES
('community-index', 'community-single', 'Community Index');

--
-- Tabs
--
INSERT INTO `core_form_tab` (`Tab_ID`, `form`, `title`, `subtitle`, `icon`, `counter`, `sort_id`, `filter_check`, `filter_value`) VALUES ('community-base', 'community-single', 'Community', 'Base', 'fas fa-cogs', '', '0', '', '');

--
-- Buttons
--
INSERT INTO `core_form_button` (`Button_ID`, `label`, `icon`, `title`, `href`, `class`, `append`, `form`, `mode`, `filter_check`, `filter_value`) VALUES
(NULL, 'Save Community', 'fas fa-save', 'Save Community', '#', 'primary saveForm', '', 'community-single', 'link', '', ''),
(NULL, 'Edit Community', 'fas fa-edit', 'Edit Community', '/community/edit/##ID##', 'primary', '', 'community-view', 'link', '', ''),
(NULL, 'Add Community', 'fas fa-plus', 'Add Community', '/community/add', 'primary', '', 'community-index', 'link', '', ''),
(NULL, 'Export Communitys', 'fas fa-file-excel', 'Export Communitys', '/community/export', 'primary', '', 'community-index', 'link', '', ''),
(NULL, 'Find Communitys', 'fas fa-searh', 'Find Communitys', '/community/search', 'primary', '', 'community-index', 'link', '', ''),
(NULL, 'Export Communitys', 'fas fa-file-excel', 'Export Communitys', '#', 'primary initExcelDump', '', 'community-search', 'link', '', ''),
(NULL, 'New Search', 'fas fa-searh', 'New Search', '/community/search', 'primary', '', 'community-search', 'link', '', '');

--
-- Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_list`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'text', 'Name', 'label', 'community-base', 'community-single', 'col-md-3', '/community/view/##ID##', '', 0, 1, 0, '', '', '');

--
-- User XP Activity
--
INSERT INTO `user_xp_activity` (`Activity_ID`, `xp_key`, `label`, `xp_base`) VALUES
(NULL, 'community-add', 'Add New Community', '50'),
(NULL, 'community-edit', 'Edit Community', '5'),
(NULL, 'community-export', 'Edit Community', '5');

COMMIT;
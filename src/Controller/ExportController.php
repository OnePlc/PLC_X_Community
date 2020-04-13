<?php
/**
 * ExportController.php - Community Export Controller
 *
 * Main Controller for Community Export
 *
 * @category Controller
 * @package Community
 * @author Verein onePlace
 * @copyright (C) 2020  Verein onePlace <admin@1plc.ch>
 * @license https://opensource.org/licenses/BSD-3-Clause
 * @version 1.0.0
 * @since 1.0.0
 */

namespace OnePlace\Community\Controller;

use Application\Controller\CoreController;
use Application\Controller\CoreExportController;
use OnePlace\Community\Model\CommunityTable;
use Laminas\Db\Sql\Where;
use Laminas\Db\Adapter\AdapterInterface;
use Laminas\View\Model\ViewModel;


class ExportController extends CoreExportController
{
    /**
     * ApiController constructor.
     *
     * @param AdapterInterface $oDbAdapter
     * @param CommunityTable $oTableGateway
     * @since 1.0.0
     */
    public function __construct(AdapterInterface $oDbAdapter,CommunityTable $oTableGateway,$oServiceManager) {
        parent::__construct($oDbAdapter,$oTableGateway,$oServiceManager);
    }


    /**
     * Dump Communitys to excel file
     *
     * @return ViewModel
     * @since 1.0.0
     */
    public function dumpAction() {
        $this->layout('layout/json');

        # Use Default export function
        $aViewData = $this->exportData('Communitys','community');

        # return data to view (popup)
        return new ViewModel($aViewData);
    }
}
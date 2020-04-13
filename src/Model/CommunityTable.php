<?php
/**
 * CommunityTable.php - Community Table
 *
 * Table Model for Community
 *
 * @category Model
 * @package Community
 * @author Verein onePlace
 * @copyright (C) 2020 Verein onePlace <admin@1plc.ch>
 * @license https://opensource.org/licenses/BSD-3-Clause
 * @version 1.0.0
 * @since 1.0.0
 */

namespace OnePlace\Community\Model;

use Application\Controller\CoreController;
use Application\Model\CoreEntityTable;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\Db\Sql\Select;
use Laminas\Db\Sql\Where;
use Laminas\Paginator\Paginator;
use Laminas\Paginator\Adapter\DbSelect;

class CommunityTable extends CoreEntityTable {

    /**
     * CommunityTable constructor.
     *
     * @param TableGateway $tableGateway
     * @since 1.0.0
     */
    public function __construct(TableGateway $tableGateway) {
        parent::__construct($tableGateway);

        # Set Single Form Name
        $this->sSingleForm = 'community-single';
    }

    /**
     * Get Community Entity
     *
     * @param int $id
     * @param string $sKey
     * @return mixed
     * @since 1.0.0
     */
    public function getSingle($id,$sKey = 'Community_ID') {
        # Use core function
        return $this->getSingleEntity($id,$sKey);
    }

    /**
     * Save Community Entity
     *
     * @param Community $oCommunity
     * @return int Community ID
     * @since 1.0.0
     */
    public function saveSingle(Community $oCommunity) {
        $aDefaultData = [
            'label' => $oCommunity->label,
        ];

        return $this->saveSingleEntity($oCommunity,'Community_ID',$aDefaultData);
    }

    /**
     * Generate new single Entity
     *
     * @return Community
     * @since 1.0.0
     */
    public function generateNew() {
        return new Community($this->oTableGateway->getAdapter());
    }
}
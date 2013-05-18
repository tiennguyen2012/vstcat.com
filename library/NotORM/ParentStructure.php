<?php
class ParentStructure extends NotORM_Structure_Convention {
	function getReferencedTable($name, $table) {
		if ($name == "parent") {
			return $table;
		}
	}
}
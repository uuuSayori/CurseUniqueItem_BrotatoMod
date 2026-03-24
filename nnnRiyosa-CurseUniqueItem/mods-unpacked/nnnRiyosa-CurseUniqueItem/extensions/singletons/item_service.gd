extends "res://singletons/item_service.gd"

func process_item_box(consumable_data: ConsumableData, wave: int, player_index: int) -> ItemParentData:
	var _item_to_process = .process_item_box(consumable_data, wave, player_index)
	
	# check item if unique and curse it
	var PlayerCurseValue = RunData.get_player_effect(Keys.stat_curse_hash, player_index)
	if PlayerCurseValue > 0 :
		if _item_to_process.get_category() == Category.ITEM :
			if _item_to_process.max_nb == 1 and not _item_to_process.is_cursed :
					for dlc_id in RunData.enabled_dlcs :
						var dlc_data = ProgressData.get_dlc_data(dlc_id)
						if dlc_data and dlc_data.has_method("curse_item") :
							_item_to_process = dlc_data.curse_item(_item_to_process, player_index)
				
	return _item_to_process

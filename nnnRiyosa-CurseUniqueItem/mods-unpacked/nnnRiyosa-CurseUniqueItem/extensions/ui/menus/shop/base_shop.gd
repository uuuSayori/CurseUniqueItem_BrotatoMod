extends "res://ui/menus/shop/base_shop.gd"

func fill_shop_items(player_locked_items: Array, player_index: int, just_entered_shop: bool = false) -> void :
	.fill_shop_items(player_locked_items, player_index, just_entered_shop)
		
	# check item if unique and curse it
	var _player_curse_value = RunData.get_player_effect(Keys.stat_curse_hash, player_index)
	if _player_curse_value > 0 :
		for check_i in _shop_items[player_index].size() :
			if _shop_items[player_index][check_i][0].get_category() == Category.ITEM :
				if _shop_items[player_index][check_i][0].max_nb == 1 and not _shop_items[player_index][check_i][0].is_cursed :
					for dlc_id in RunData.enabled_dlcs:
						var dlc_data = ProgressData.get_dlc_data(dlc_id)
						if dlc_data and dlc_data.has_method("curse_item"):
							_shop_items[player_index][check_i][0] = dlc_data.curse_item(_shop_items[player_index][check_i][0], player_index)
						

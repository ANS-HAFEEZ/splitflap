(kicad_sch
	(version 20250114)
	(generator "eeschema")
	(generator_version "9.0")
	(uuid "18e69150-85a7-46a5-9daf-162535eb3a75")
	(paper "USLetter")
	(title_block
		(title "Splitflap Chainlink Buddy - T-Display")
	)
	(lib_symbols
		(symbol "Connector:Barrel_Jack_Switch"
			(pin_names
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "J"
				(at 0 5.334 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Barrel_Jack_Switch"
				(at 0 -5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 1.27 -1.016 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 1.27 -1.016 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "DC Barrel Jack with an internal switch"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "DC power barrel jack connector"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "BarrelJack*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Barrel_Jack_Switch_0_1"
				(rectangle
					(start -5.08 3.81)
					(end 5.08 -3.81)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -3.81 -2.54) (xy -2.54 -2.54) (xy -1.27 -1.27) (xy 0 -2.54) (xy 2.54 -2.54) (xy 5.08 -2.54)
					)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -3.302 1.905)
					(mid -3.9343 2.54)
					(end -3.302 3.175)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -3.302 1.905)
					(mid -3.9343 2.54)
					(end -3.302 3.175)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.27 -2.286) (xy 1.905 -1.651)
					)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 3.683 3.175)
					(end -3.302 1.905)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 5.08 2.54) (xy 3.81 2.54)
					)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.08 0) (xy 1.27 0) (xy 1.27 -2.286) (xy 0.635 -1.651)
					)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "Barrel_Jack_Switch_1_1"
				(pin passive line
					(at 7.62 2.54 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 0 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 -2.54 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Connector:Screw_Terminal_01x03"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "J"
				(at 0 5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Screw_Terminal_01x03"
				(at 0 -5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Generic screw terminal, single row, 01x03, script generated (kicad-library-utils/schlib/autogen/connector/)"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "screw terminal"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "TerminalBlock*:*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Screw_Terminal_01x03_1_1"
				(rectangle
					(start -1.27 3.81)
					(end 1.27 -3.81)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -0.5334 2.8702) (xy 0.3302 2.032)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.5334 0.3302) (xy 0.3302 -0.508)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.5334 -2.2098) (xy 0.3302 -3.048)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.3556 3.048) (xy 0.508 2.2098)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.3556 0.508) (xy 0.508 -0.3302)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.3556 -2.032) (xy 0.508 -2.8702)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 2.54)
					(radius 0.635)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 0.635)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 -2.54)
					(radius 0.635)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(pin passive line
					(at -5.08 2.54 0)
					(length 3.81)
					(name "Pin_1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 0 0)
					(length 3.81)
					(name "Pin_2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 -2.54 0)
					(length 3.81)
					(name "Pin_3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Connector_Generic:Conn_01x04"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "J"
				(at 0 5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Conn_01x04"
				(at 0 -7.62 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Generic connector, single row, 01x04, script generated (kicad-library-utils/schlib/autogen/connector/)"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "connector"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Connector*:*_1x??_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Conn_01x04_1_1"
				(rectangle
					(start -1.27 3.81)
					(end 1.27 -6.35)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
				(rectangle
					(start -1.27 2.667)
					(end 0 2.413)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.27 0.127)
					(end 0 -0.127)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.27 -2.413)
					(end 0 -2.667)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.27 -4.953)
					(end 0 -5.207)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(pin passive line
					(at -5.08 2.54 0)
					(length 3.81)
					(name "Pin_1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 0 0)
					(length 3.81)
					(name "Pin_2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 -2.54 0)
					(length 3.81)
					(name "Pin_3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 -5.08 0)
					(length 3.81)
					(name "Pin_4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Connector_Generic:Conn_02x04_Odd_Even"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "J"
				(at 1.27 5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Conn_02x04_Odd_Even"
				(at 1.27 -7.62 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Generic connector, double row, 02x04, odd/even pin numbering scheme (row 1 odd numbers, row 2 even numbers), script generated (kicad-library-utils/schlib/autogen/connector/)"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "connector"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Connector*:*_2x??_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Conn_02x04_Odd_Even_1_1"
				(rectangle
					(start -1.27 3.81)
					(end 3.81 -6.35)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
				(rectangle
					(start -1.27 2.667)
					(end 0 2.413)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.27 0.127)
					(end 0 -0.127)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.27 -2.413)
					(end 0 -2.667)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.27 -4.953)
					(end 0 -5.207)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 3.81 2.667)
					(end 2.54 2.413)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 3.81 0.127)
					(end 2.54 -0.127)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 3.81 -2.413)
					(end 2.54 -2.667)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 3.81 -4.953)
					(end 2.54 -5.207)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(pin passive line
					(at -5.08 2.54 0)
					(length 3.81)
					(name "Pin_1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 0 0)
					(length 3.81)
					(name "Pin_3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 -2.54 0)
					(length 3.81)
					(name "Pin_5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 -5.08 0)
					(length 3.81)
					(name "Pin_7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 2.54 180)
					(length 3.81)
					(name "Pin_2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 0 180)
					(length 3.81)
					(name "Pin_4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 -2.54 180)
					(length 3.81)
					(name "Pin_6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 -5.08 180)
					(length 3.81)
					(name "Pin_8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Device:C_Small"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0.254)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "C"
				(at 0.254 1.778 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "C_Small"
				(at 0.254 -2.032 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Unpolarized capacitor, small symbol"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "capacitor cap"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "C_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "C_Small_0_1"
				(polyline
					(pts
						(xy -1.524 0.508) (xy 1.524 0.508)
					)
					(stroke
						(width 0.3048)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -0.508) (xy 1.524 -0.508)
					)
					(stroke
						(width 0.3302)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "C_Small_1_1"
				(pin passive line
					(at 0 2.54 270)
					(length 2.032)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 -2.54 90)
					(length 2.032)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32Modules:TTGO_TDisplay"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at -5.08 19.05 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "TTGO_TDisplay"
				(at 0 16.51 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at -5.08 1.27 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at -5.08 1.27 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "TTGO_TDisplay_0_1"
				(rectangle
					(start -10.16 17.78)
					(end 10.16 -17.78)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -2.794 0.762) (xy -3.556 -0.508) (xy -2.032 -0.508) (xy -2.794 0.762)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.794 0.254) (xy -2.794 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -2.794 -0.254)
					(radius 0.0001)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -1.778) (xy -2.286 -3.048) (xy -0.762 -3.048) (xy -1.524 -1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -2.286) (xy -1.524 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -1.524 -2.794)
					(radius 0.0001)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -6.858) (xy -2.286 -8.128) (xy -0.762 -8.128) (xy -1.524 -6.858)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -7.366) (xy -1.524 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -1.524 -7.874)
					(radius 0.0001)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 9.398 10.16) (xy 10.16 10.922) (xy 10.16 9.398) (xy 9.398 10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 9.398 7.62) (xy 10.16 8.382) (xy 10.16 6.858) (xy 9.398 7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 9.398 5.08) (xy 10.16 5.842) (xy 10.16 4.318) (xy 9.398 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 9.398 2.54) (xy 10.16 3.302) (xy 10.16 1.778) (xy 9.398 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "TTGO_TDisplay_1_1"
				(pin passive line
					(at -12.7 12.7 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 10.16 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 7.62 0)
					(length 2.54)
					(name "GPIO21"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 5.08 0)
					(length 2.54)
					(name "GPIO22"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 2.54 0)
					(length 2.54)
					(name "GPIO17"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 0 0)
					(length 2.54)
					(name "GPIO2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 -2.54 0)
					(length 2.54)
					(name "GPIO15"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 -5.08 0)
					(length 2.54)
					(name "GPIO13"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 -7.62 0)
					(length 2.54)
					(name "GPIO12"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 -10.16 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 -12.7 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "11"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -12.7 -15.24 0)
					(length 2.54)
					(name "3V3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "12"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 12.7 180)
					(length 2.54)
					(name "3V3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "24"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 10.16 180)
					(length 2.54)
					(name "GPIO36"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "23"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 7.62 180)
					(length 2.54)
					(name "GPIO37"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "22"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 5.08 180)
					(length 2.54)
					(name "GPIO38"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "21"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 2.54 180)
					(length 2.54)
					(name "GPIO39"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "20"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 0 180)
					(length 2.54)
					(name "GPIO32"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "19"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 -2.54 180)
					(length 2.54)
					(name "GPIO33"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "18"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 -5.08 180)
					(length 2.54)
					(name "GPIO25"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "17"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 -7.62 180)
					(length 2.54)
					(name "GPIO26"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "16"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 -10.16 180)
					(length 2.54)
					(name "GPIO27"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "15"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 -12.7 180)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "14"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 12.7 -15.24 180)
					(length 2.54)
					(name "5V"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "13"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Mechanical:MountingHole_Pad"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom no)
			(on_board yes)
			(property "Reference" "H"
				(at 0 6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "MountingHole_Pad"
				(at 0 4.445 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Mounting Hole with connection"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "mounting hole"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "MountingHole*Pad*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "MountingHole_Pad_0_1"
				(circle
					(center 0 1.27)
					(radius 1.27)
					(stroke
						(width 1.27)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "MountingHole_Pad_1_1"
				(pin input line
					(at 0 -2.54 90)
					(length 2.54)
					(name "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Regulator_Linear:LM7805_TO220"
			(pin_names
				(offset 0.254)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at -3.81 3.175 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "LM7805_TO220"
				(at 0 3.175 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" "Package_TO_SOT_THT:TO-220-3_Vertical"
				(at 0 5.715 0)
				(effects
					(font
						(size 1.27 1.27)
						(italic yes)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF"
				(at 0 -1.27 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Positive 1A 35V Linear Regulator, Fixed Output 5V, TO-220"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "Voltage Regulator 1A Positive"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "TO?220*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "LM7805_TO220_0_1"
				(rectangle
					(start -5.08 1.905)
					(end 5.08 -5.08)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "LM7805_TO220_1_1"
				(pin power_in line
					(at -7.62 0 0)
					(length 2.54)
					(name "VI"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at 0 -7.62 90)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_out line
					(at 7.62 0 180)
					(length 2.54)
					(name "VO"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "no_pin:no_pin"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "Z"
				(at -8.89 3.81 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "no_pin"
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "no_pin_0_1"
				(rectangle
					(start -10.16 2.54)
					(end 10.16 -2.54)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:+12V"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+12V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"+12V\""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+12V_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+12V_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:+3.3V"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+3.3V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"+3.3V\""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+3.3V_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+3.3V_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:+5V"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+5V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"+5V\""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+5V_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+5V_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:GND"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "GND"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "GND_0_1"
				(polyline
					(pts
						(xy 0 0) (xy 0 -1.27) (xy 1.27 -1.27) (xy 0 -2.54) (xy -1.27 -1.27) (xy 0 -1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "GND_1_1"
				(pin power_in line
					(at 0 0 270)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:PWR_FLAG"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#FLG"
				(at 0 1.905 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "PWR_FLAG"
				(at 0 3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Special symbol for telling ERC where power comes from"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "flag power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "PWR_FLAG_0_0"
				(pin power_out line
					(at 0 0 90)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(symbol "PWR_FLAG_0_1"
				(polyline
					(pts
						(xy 0 0) (xy 0 1.27) (xy -1.016 1.905) (xy 0 2.54) (xy 1.016 1.905) (xy 0 1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(embedded_fonts no)
		)
	)
	(junction
		(at 57.15 104.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "056a3a10-3997-424e-8025-0eee5cf73001")
	)
	(junction
		(at 49.53 46.99)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0635dd96-fafc-4337-a6c9-307248121c6a")
	)
	(junction
		(at 63.5 78.74)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1c90b9fe-6753-4256-8682-4b4966bfc612")
	)
	(junction
		(at 177.8 88.9)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "32952822-21dc-4f45-b125-3995642a16b1")
	)
	(junction
		(at 83.82 41.91)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "34d40aa5-8d28-4c09-afa8-602fa5ee60ec")
	)
	(junction
		(at 107.95 41.91)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "3f1d1cd0-d83d-4ab0-aa96-6c57a0b9ea3f")
	)
	(junction
		(at 177.8 91.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "5235652d-ea18-4a14-a7e4-b80c8bf88e01")
	)
	(junction
		(at 177.8 86.36)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "5259c2ff-7e1c-45c1-b7ce-56a70b60c852")
	)
	(junction
		(at 135.89 35.56)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "7e8053bf-6a5d-46f7-8e9b-630ec8676b34")
	)
	(junction
		(at 49.53 41.91)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "aefd84c7-4662-47e1-85e2-3884993c8e3b")
	)
	(junction
		(at 140.97 35.56)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c47596bd-d3a0-4806-b709-d338c9eff973")
	)
	(junction
		(at 78.74 148.59)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c86ffe54-4dbd-44b5-90cc-1836bd0721b1")
	)
	(junction
		(at 63.5 99.06)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "cea1a753-48b8-4515-9df4-1d0093fdb064")
	)
	(junction
		(at 78.74 146.05)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "cfdc574b-25df-41af-b3a0-3862c77f52c2")
	)
	(junction
		(at 95.25 49.53)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d4b0f6f1-bc0e-42eb-8fbf-770de244493a")
	)
	(junction
		(at 78.74 143.51)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "dbfd974b-6461-4979-a5d4-d05eab4301b7")
	)
	(junction
		(at 63.5 101.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "facd9c19-1d8d-4613-95f9-400c285dcfa0")
	)
	(junction
		(at 138.43 35.56)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fe7772fc-7cb9-4ea0-b57e-b7053c7a6e0a")
	)
	(no_connect
		(at 92.71 76.2)
		(uuid "0a83b4c0-bec8-4925-a224-b9eb9b4d9cd3")
	)
	(no_connect
		(at 92.71 83.82)
		(uuid "16f77877-7035-4df8-a162-3f84a969b228")
	)
	(no_connect
		(at 67.31 81.28)
		(uuid "217fe11c-d06f-49fe-96df-638e5500a612")
	)
	(no_connect
		(at 67.31 91.44)
		(uuid "265f2c07-f311-49f3-aabb-2d52fd8b61e8")
	)
	(no_connect
		(at 92.71 99.06)
		(uuid "4f520db3-140c-4398-bd77-2e44c64d90fb")
	)
	(no_connect
		(at 67.31 96.52)
		(uuid "52158cbc-76e6-4c10-80f6-5f9c769b53a7")
	)
	(no_connect
		(at 67.31 88.9)
		(uuid "5241db8e-8aa8-455a-b9d4-6f57a5b856c3")
	)
	(no_connect
		(at 67.31 93.98)
		(uuid "5377df84-b9a4-47f9-8e4c-a3a013a18575")
	)
	(no_connect
		(at 67.31 86.36)
		(uuid "65e0e4f2-037e-481f-a190-045a05135583")
	)
	(no_connect
		(at 92.71 96.52)
		(uuid "95adccef-32c2-4556-9871-6985c79a8d78")
	)
	(no_connect
		(at 67.31 83.82)
		(uuid "b7ef81e5-f835-4cf6-9515-ee2d95990401")
	)
	(no_connect
		(at 92.71 81.28)
		(uuid "c1e442e1-398b-43fd-9209-15c7117982f4")
	)
	(no_connect
		(at 45.72 44.45)
		(uuid "d071cf02-5bb5-4570-b3c3-f19f216f2531")
	)
	(no_connect
		(at 92.71 78.74)
		(uuid "eddd7346-d3d9-4efa-9f0c-3336128bf749")
	)
	(wire
		(pts
			(xy 45.72 41.91) (xy 49.53 41.91)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "02267cd1-1cef-45df-a366-402919a2edcb")
	)
	(wire
		(pts
			(xy 92.71 91.44) (xy 111.76 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "02699408-a2c3-4db7-9787-d776246278ae")
	)
	(wire
		(pts
			(xy 102.87 41.91) (xy 107.95 41.91)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "05343dc0-1085-4ab4-a7d2-38270739fe7f")
	)
	(wire
		(pts
			(xy 100.33 104.14) (xy 92.71 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "08a1a0da-519e-4722-9fa8-d1815477131c")
	)
	(wire
		(pts
			(xy 96.52 101.6) (xy 96.52 106.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "16530c3c-84b6-46b0-aaa4-35ed18b4b2f3")
	)
	(wire
		(pts
			(xy 63.5 99.06) (xy 67.31 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1ecffce3-780f-4252-9e10-ff80c4039296")
	)
	(wire
		(pts
			(xy 83.82 49.53) (xy 95.25 49.53)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1fd698f6-b432-464e-88b1-f9ce12c7b4eb")
	)
	(wire
		(pts
			(xy 92.71 86.36) (xy 111.76 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "244642be-a58b-447d-a44b-fad9c0237712")
	)
	(wire
		(pts
			(xy 95.25 52.07) (xy 95.25 49.53)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24e9a057-3146-45e3-b2bb-9deb0171ecb0")
	)
	(wire
		(pts
			(xy 57.15 104.14) (xy 57.15 97.79)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24e9d199-dac0-43e2-aa13-1fc98168acca")
	)
	(wire
		(pts
			(xy 49.53 46.99) (xy 57.15 46.99)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2a42ca86-8c0d-475b-b764-f622ef8ec3d6")
	)
	(wire
		(pts
			(xy 123.19 120.65) (xy 120.65 120.65)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2cb9b9f6-dd75-4e3d-bbab-8efe0a74b67b")
	)
	(wire
		(pts
			(xy 92.71 88.9) (xy 111.76 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2e7d0ce9-d2ad-4876-a1e4-4ed338fc5c21")
	)
	(wire
		(pts
			(xy 63.5 101.6) (xy 63.5 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "325edf39-274e-44bb-8261-7276d7c684bf")
	)
	(wire
		(pts
			(xy 120.65 118.11) (xy 123.19 118.11)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "33357b4c-2bb2-4fef-bdd1-36d90de6d8ee")
	)
	(wire
		(pts
			(xy 83.82 46.99) (xy 83.82 49.53)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "37a6a085-0928-4787-bef2-e4edaea09206")
	)
	(wire
		(pts
			(xy 149.86 88.9) (xy 165.1 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3805970a-006e-4d7e-832f-0e6b5df1a06e")
	)
	(wire
		(pts
			(xy 140.97 35.56) (xy 146.05 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3c049fab-26c7-4081-8391-27ec84d3dd25")
	)
	(wire
		(pts
			(xy 49.53 46.99) (xy 49.53 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3cd56cb6-89e8-48d0-8b4b-99a0711cc684")
	)
	(wire
		(pts
			(xy 76.2 41.91) (xy 83.82 41.91)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "48d2ccba-be7b-49a7-b765-0f22204c1692")
	)
	(wire
		(pts
			(xy 107.95 49.53) (xy 95.25 49.53)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "54ae7232-eeb5-4217-874e-65182be50a98")
	)
	(wire
		(pts
			(xy 138.43 35.56) (xy 140.97 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5de5689f-cee2-404b-8307-5f74124cb686")
	)
	(wire
		(pts
			(xy 100.33 101.6) (xy 100.33 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5f35829c-ec7a-40a8-a8d0-a49831813279")
	)
	(wire
		(pts
			(xy 120.65 115.57) (xy 120.65 118.11)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "605d9f8e-43ef-490f-ae85-50ecad642d51")
	)
	(wire
		(pts
			(xy 67.31 76.2) (xy 63.5 76.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6733f54a-8dca-419c-b461-ca911dc6e274")
	)
	(wire
		(pts
			(xy 149.86 83.82) (xy 165.1 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "69297abf-3c98-4429-a569-e4855bafc9f1")
	)
	(wire
		(pts
			(xy 107.95 46.99) (xy 107.95 49.53)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7155e52e-43a2-4ce4-912d-9070edbe4b79")
	)
	(wire
		(pts
			(xy 130.81 35.56) (xy 135.89 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "73e4e1e5-951b-44f7-9a1e-e7aac77f61e3")
	)
	(wire
		(pts
			(xy 165.1 86.36) (xy 149.86 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "77087d95-da6c-492e-8f16-f064b5785ae0")
	)
	(wire
		(pts
			(xy 177.8 91.44) (xy 177.8 95.25)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "78400d0f-3ad8-48dc-9326-5ba3b0a54582")
	)
	(wire
		(pts
			(xy 135.89 35.56) (xy 138.43 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7b9a0933-99f5-4dad-b415-9747b7442bc8")
	)
	(wire
		(pts
			(xy 115.57 41.91) (xy 107.95 41.91)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7e5b8c55-cf58-4074-b7d1-d4971763cde7")
	)
	(wire
		(pts
			(xy 78.74 146.05) (xy 78.74 148.59)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8094edc9-439c-45f3-9e8b-ba5f5f0bf253")
	)
	(wire
		(pts
			(xy 138.43 38.1) (xy 138.43 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "813ef129-2a61-4fa5-a8ab-11ea9e840df8")
	)
	(wire
		(pts
			(xy 49.53 41.91) (xy 49.53 39.37)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8984fb0c-a435-4fee-9344-58b50ebcf8f1")
	)
	(wire
		(pts
			(xy 67.31 78.74) (xy 63.5 78.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8ef00d55-e280-4d52-b4c9-f4b5d1cf3f20")
	)
	(wire
		(pts
			(xy 177.8 86.36) (xy 177.8 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "94225a50-e3a6-48cd-952a-646e5e7f842e")
	)
	(wire
		(pts
			(xy 165.1 91.44) (xy 149.86 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9a3a86b6-7999-46dc-bfa4-60dcf831c65b")
	)
	(wire
		(pts
			(xy 45.72 46.99) (xy 49.53 46.99)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a36fa68e-9e27-4eae-8c52-c1edeb154127")
	)
	(wire
		(pts
			(xy 78.74 138.43) (xy 78.74 143.51)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "af18d319-caeb-41f5-b3a6-71612cc12d93")
	)
	(wire
		(pts
			(xy 177.8 83.82) (xy 177.8 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b559ec43-614d-4ac3-8ed0-510049e21c3b")
	)
	(wire
		(pts
			(xy 49.53 41.91) (xy 57.15 41.91)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b67790aa-e112-4765-9113-9cd313025091")
	)
	(wire
		(pts
			(xy 63.5 107.95) (xy 63.5 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b800ae2a-1ee1-4863-b14f-f79110d42357")
	)
	(wire
		(pts
			(xy 92.71 93.98) (xy 111.76 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c50bc416-f961-4f57-88bf-c96c7792b014")
	)
	(wire
		(pts
			(xy 57.15 104.14) (xy 67.31 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c6dbc81f-e08d-4299-8703-c27cabdfcd62")
	)
	(wire
		(pts
			(xy 114.3 123.19) (xy 123.19 123.19)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ca00fbf4-daa1-4f43-a0ec-fd22895d521e")
	)
	(wire
		(pts
			(xy 78.74 148.59) (xy 78.74 151.13)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ca837f8c-22b1-4768-a464-31d027dccc85")
	)
	(wire
		(pts
			(xy 50.8 104.14) (xy 57.15 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d38db024-66a5-49a7-b1ee-4b6c722d2c9c")
	)
	(wire
		(pts
			(xy 67.31 101.6) (xy 63.5 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d50bba4a-6992-4f55-9957-5d3d8c1ccab8")
	)
	(wire
		(pts
			(xy 114.3 115.57) (xy 114.3 123.19)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d6d83f15-498b-4027-95f7-e001450d277d")
	)
	(wire
		(pts
			(xy 120.65 120.65) (xy 120.65 125.73)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e22bf689-26b5-471a-8324-8aa555addfcb")
	)
	(wire
		(pts
			(xy 83.82 41.91) (xy 87.63 41.91)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e2fb4912-fe8d-4e09-b27f-498e79ebaa83")
	)
	(wire
		(pts
			(xy 78.74 143.51) (xy 78.74 146.05)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e7e68cb9-c50b-43e3-9e2f-e4a1f4a122c4")
	)
	(wire
		(pts
			(xy 63.5 76.2) (xy 63.5 78.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ea92a688-fc76-4933-9ff0-9b7f872dc97d")
	)
	(wire
		(pts
			(xy 92.71 101.6) (xy 96.52 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "edc766bf-fb12-4cef-9226-39bf67b028a7")
	)
	(wire
		(pts
			(xy 63.5 78.74) (xy 63.5 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f574331d-7968-4525-a394-4823e3a0f16d")
	)
	(wire
		(pts
			(xy 177.8 88.9) (xy 177.8 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f6032e08-a0e6-4e9c-9812-04ffcffcddba")
	)
	(label "MOTOR_DATA"
		(at 111.76 88.9 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right bottom)
		)
		(uuid "11432295-4f1d-45b4-9e10-a705a502215f")
	)
	(label "SENSOR_DATA"
		(at 111.76 86.36 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right bottom)
		)
		(uuid "20af1e74-e539-4a1f-9f1d-ed40dae65219")
	)
	(label "SENSOR_DATA"
		(at 149.86 88.9 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "2aab62ce-2ea9-4683-a714-8aebbe8cd68d")
	)
	(label "LATCH"
		(at 149.86 91.44 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "37efc4d5-5e57-4b53-81d9-aaf3919ab4f6")
	)
	(label "CLOCK"
		(at 111.76 91.44 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right bottom)
		)
		(uuid "38489a0a-df0e-444f-a9f9-7608d63f3531")
	)
	(label "MOTOR_DATA"
		(at 149.86 86.36 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "8aea9efc-6853-4156-b076-d16526f1dfdd")
	)
	(label "CLOCK"
		(at 149.86 83.82 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "a12376bc-42f9-4db3-94f0-a60adb996342")
	)
	(label "LATCH"
		(at 111.76 93.98 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right bottom)
		)
		(uuid "ebd6c383-fa1a-4a73-9301-37d569d56e09")
	)
	(symbol
		(lib_id "Connector:Barrel_Jack_Switch")
		(at 38.1 44.45 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617cede5")
		(property "Reference" "J3"
			(at 39.5478 36.3982 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "Barrel_Jack_Switch"
			(at 39.5478 38.7096 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "PJ-202A:PJ-202A"
			(at 39.37 45.466 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 39.37 45.466 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 38.1 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "89e690a9-4874-41f1-adf3-13cac512b0cb")
		)
		(pin "3"
			(uuid "34b63cfb-c275-48cd-a710-0e16ee795155")
		)
		(pin "2"
			(uuid "4f06078c-3bef-42d7-8bab-ebab14bea36c")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "J3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+12V")
		(at 49.53 39.37 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617d49a3")
		(property "Reference" "#PWR02"
			(at 49.53 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+12V"
			(at 49.911 34.9758 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 49.53 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 49.53 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 49.53 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "bdceda35-7c1d-4ff1-8f68-464d1ed9e468")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR02")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 49.53 50.8 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617d5f7c")
		(property "Reference" "#PWR05"
			(at 49.53 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 49.657 55.1942 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 49.53 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 49.53 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 49.53 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "c234cfff-ec19-4e76-a322-d56b26a12d8c")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR05")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Regulator_Linear:LM7805_TO220")
		(at 95.25 41.91 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617dc13f")
		(property "Reference" "U2"
			(at 95.25 35.7632 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "LM7805_TO220"
			(at 95.25 38.0746 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "ModifiedSymbols:TO-220-3_Vertical"
			(at 95.25 36.195 0)
			(effects
				(font
					(size 1.27 1.27)
					(italic yes)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF"
			(at 95.25 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 95.25 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "18f53b72-4453-4d9c-82c3-8b67da674281")
		)
		(pin "1"
			(uuid "b110e617-5a6d-4ae7-bd44-efb31da6de97")
		)
		(pin "3"
			(uuid "e143b53e-0a7b-43a5-9d41-dba8adf0225b")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "U2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:C_Small")
		(at 83.82 44.45 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617dda1a")
		(property "Reference" "C1"
			(at 82.55 38.1 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10uF"
			(at 80.01 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder"
			(at 83.82 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 83.82 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 83.82 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "e71f6a48-af3f-408b-9c08-89af5afd9e12")
		)
		(pin "2"
			(uuid "6563eaa0-abc5-494d-ae6f-2c3e9517a478")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "C1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:C_Small")
		(at 107.95 44.45 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617e09df")
		(property "Reference" "C2"
			(at 106.68 38.1 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF"
			(at 104.14 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder"
			(at 107.95 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 107.95 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 107.95 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "b5ed12f1-71c7-4e46-8a39-78a7e7c4f2c6")
		)
		(pin "2"
			(uuid "dc5e4a8e-3b91-4c83-bcfa-b5dd327ac53f")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "C2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+12V")
		(at 76.2 41.91 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617e2c4f")
		(property "Reference" "#PWR03"
			(at 76.2 45.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+12V"
			(at 76.581 37.5158 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 76.2 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 76.2 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 76.2 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "78ad8a25-545a-40a4-b98f-7bb1f7fb4e25")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR03")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+5V")
		(at 115.57 41.91 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617e4049")
		(property "Reference" "#PWR04"
			(at 115.57 45.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5V"
			(at 115.951 37.5158 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 115.57 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 115.57 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 115.57 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "a0e1d51d-4578-4f64-9bec-cfff3765cb81")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR04")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 95.25 52.07 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617e548e")
		(property "Reference" "#PWR06"
			(at 95.25 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 95.377 56.4642 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 95.25 52.07 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 95.25 52.07 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 95.25 52.07 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "c72c074e-8f52-44e8-8cf5-2bc3f806d4ab")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR06")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+12V")
		(at 114.3 115.57 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617ebe63")
		(property "Reference" "#PWR07"
			(at 114.3 119.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+12V"
			(at 114.681 111.1758 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 114.3 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 114.3 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 114.3 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "12911da5-5ac3-4776-8708-5644ca21da82")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR07")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "no_pin:no_pin")
		(at 39.37 29.21 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617f16bd")
		(property "Reference" "Z1"
			(at 39.37 21.9202 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "polarity label"
			(at 39.37 24.6126 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "Symbol:Symbol_Barrel_Polarity"
			(at 39.37 29.21 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 39.37 29.21 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 39.37 29.21 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "Z1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:PWR_FLAG")
		(at 57.15 41.91 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617f3266")
		(property "Reference" "#FLG0101"
			(at 57.15 40.005 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 57.15 37.5158 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 57.15 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 57.15 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 57.15 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "991bca65-2a81-49f6-ac77-a3a9c310f78d")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#FLG0101")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:PWR_FLAG")
		(at 57.15 46.99 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617f36a9")
		(property "Reference" "#FLG0102"
			(at 57.15 45.085 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 57.15 42.5958 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 57.15 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 57.15 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 57.15 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "ed7971a8-8972-430d-a672-406546c67087")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#FLG0102")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:PWR_FLAG")
		(at 50.8 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000617f6261")
		(property "Reference" "#FLG0103"
			(at 50.8 102.235 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 50.8 99.7458 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 50.8 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 50.8 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 50.8 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f1c49da0-9947-4f6c-9f80-3e8954230b38")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#FLG0103")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32Modules:TTGO_TDisplay")
		(at 80.01 88.9 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a38eb2")
		(property "Reference" "U1"
			(at 80.01 66.929 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "TTGO_TDisplay"
			(at 80.01 69.2404 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "ESP32:T-DISPLAY_extra_pins_labeled_double"
			(at 74.93 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 74.93 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 80.01 88.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "18"
			(uuid "b4afb388-cc0a-43d7-86ea-37a5dacd7682")
		)
		(pin "2"
			(uuid "53e3a2f8-d8a8-46c4-8536-10cd174f87b3")
		)
		(pin "3"
			(uuid "72afaea4-9e9e-48e4-9bc7-f3a43761a160")
		)
		(pin "6"
			(uuid "5953efdc-64ba-4db7-a63b-24ef90ce5a34")
		)
		(pin "7"
			(uuid "42f2de5d-762f-498b-94d9-49979b7af8ac")
		)
		(pin "1"
			(uuid "60b7df3f-ac9b-48b3-a062-a4456e996e31")
		)
		(pin "11"
			(uuid "4e81fc11-0a9f-4249-995c-93198ef1407e")
		)
		(pin "22"
			(uuid "572061df-0161-4af5-b495-199795979abb")
		)
		(pin "21"
			(uuid "ad959438-02db-424e-bed1-91ee7c29da14")
		)
		(pin "17"
			(uuid "0517d620-4a7c-4265-8a1e-e27b1ab01f20")
		)
		(pin "24"
			(uuid "8cd772c6-c13d-441b-810f-5a1e2cd09f90")
		)
		(pin "5"
			(uuid "68b2b4fa-9506-465c-bad0-c607eb172218")
		)
		(pin "10"
			(uuid "fb64e3a1-5a7c-4615-a87e-300ff1a38e50")
		)
		(pin "4"
			(uuid "309b5eff-a066-422d-bb70-6588f8b2014b")
		)
		(pin "12"
			(uuid "ce3986b4-7b1d-4f98-ab32-f770783455fe")
		)
		(pin "8"
			(uuid "052889be-7e2f-4547-92aa-fe4d21681c42")
		)
		(pin "19"
			(uuid "4f587333-26bd-481c-bbdc-fef551f7e381")
		)
		(pin "23"
			(uuid "7f795e2b-42f7-4d31-9ade-3be9a9c2e9b3")
		)
		(pin "20"
			(uuid "3f772ef5-c729-4c6f-af18-2cc530a64a56")
		)
		(pin "9"
			(uuid "150ec7f6-65f7-4259-bcb2-8179c2f0f93a")
		)
		(pin "14"
			(uuid "9e7f95ce-a7f1-4afc-88b9-46599d7d0191")
		)
		(pin "13"
			(uuid "87820900-a757-4c39-aac6-df2356cedd8e")
		)
		(pin "16"
			(uuid "293fd1b3-f980-4bd8-9441-61a8cd0fb983")
		)
		(pin "15"
			(uuid "1ecb6833-8212-4c34-badd-10a0300e9e01")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "U1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector_Generic:Conn_02x04_Odd_Even")
		(at 170.18 86.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a3a5ec")
		(property "Reference" "J1"
			(at 171.45 78.3082 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "Output"
			(at 171.45 80.6196 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "ModifiedSymbols:IDC-Header_2x04_P2.54mm_Vertical"
			(at 170.18 86.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 170.18 86.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 170.18 86.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "3"
			(uuid "0a36d420-af39-43bc-8a56-b685d05b79c4")
		)
		(pin "5"
			(uuid "0669d17d-d0df-4061-9a0d-c16560133ba1")
		)
		(pin "2"
			(uuid "46b3e58d-9205-4f19-81ca-542ec434302b")
		)
		(pin "7"
			(uuid "9f7bb808-1ed7-440f-98f8-db52739b688d")
		)
		(pin "4"
			(uuid "24ffd20b-b97a-4743-adb8-a104dc9af454")
		)
		(pin "1"
			(uuid "f2c790e1-5e19-4677-9a07-3372c5603520")
		)
		(pin "6"
			(uuid "8e9ad646-8271-4d47-9c7f-f2d4adf9b0f3")
		)
		(pin "8"
			(uuid "c2493b58-ae8d-491e-88b0-78efaf5e6935")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "J1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 177.8 95.25 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a3aee0")
		(property "Reference" "#PWR01"
			(at 177.8 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 177.927 99.6442 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 177.8 95.25 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 177.8 95.25 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 177.8 95.25 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "d3809821-f388-4a99-9dc4-02808c75690e")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR01")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Mechanical:MountingHole_Pad")
		(at 130.81 33.02 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a7210a")
		(property "Reference" "H1"
			(at 133.35 31.7754 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "MountingHole_Pad"
			(at 133.35 34.0868 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "MountingHole:MountingHole_3.2mm_M3_ISO7380_Pad"
			(at 130.81 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 130.81 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 130.81 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "3dbd2ad5-8429-4fde-8fa9-07df95b7ff0f")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "H1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Mechanical:MountingHole_Pad")
		(at 135.89 33.02 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a72b0c")
		(property "Reference" "H2"
			(at 138.43 31.7754 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "MountingHole_Pad"
			(at 138.43 34.0868 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "MountingHole:MountingHole_3.2mm_M3_ISO7380_Pad"
			(at 135.89 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 135.89 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 135.89 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "e6fe7119-f16d-4fb2-aab9-1ca2c88d5962")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "H2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Mechanical:MountingHole_Pad")
		(at 140.97 33.02 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a72dcf")
		(property "Reference" "H3"
			(at 143.51 31.7754 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "MountingHole_Pad"
			(at 143.51 34.0868 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "MountingHole:MountingHole_3.2mm_M3_ISO7380_Pad"
			(at 140.97 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 140.97 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 140.97 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "d671c494-3193-419f-9246-b5937aec92b9")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "H3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Mechanical:MountingHole_Pad")
		(at 146.05 33.02 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a7316a")
		(property "Reference" "H4"
			(at 148.59 31.7754 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "MountingHole_Pad"
			(at 148.59 34.0868 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "MountingHole:MountingHole_3.2mm_M3_ISO7380_Pad"
			(at 146.05 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 146.05 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 146.05 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "92859bda-96e4-40ce-8053-352d67c2fbee")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "H4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 138.43 38.1 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a736a5")
		(property "Reference" "#PWR0101"
			(at 138.43 44.45 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 138.557 42.4942 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 138.43 38.1 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 138.43 38.1 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 138.43 38.1 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "43e48cec-562c-44fd-97d6-262e7001d021")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0101")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector:Screw_Terminal_01x03")
		(at 128.27 120.65 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a7aae2")
		(property "Reference" "J2"
			(at 130.302 119.5832 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Screw_Terminal_01x03"
			(at 130.302 121.8946 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "ScrewTerminals:Generic-5.08-3P"
			(at 128.27 120.65 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 128.27 120.65 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 128.27 120.65 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "3"
			(uuid "4804b6e1-60c0-4c06-a805-9cff2caf669b")
		)
		(pin "1"
			(uuid "7b1f1908-d50b-4014-b4f7-91fba9620b42")
		)
		(pin "2"
			(uuid "d22a3e04-23bc-41b1-a2db-8f86dc710b0d")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "J2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+3.3V")
		(at 57.15 97.79 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a7c7d9")
		(property "Reference" "#PWR0102"
			(at 57.15 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3V"
			(at 57.531 93.3958 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 57.15 97.79 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 57.15 97.79 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 57.15 97.79 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "531ff697-763e-407b-a731-136a876e40c1")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0102")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 96.52 106.68 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a7d8bf")
		(property "Reference" "#PWR0103"
			(at 96.52 113.03 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 96.647 111.0742 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 96.52 106.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 96.52 106.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 96.52 106.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "2895b855-276c-4e51-901d-7df4c282e4a8")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0103")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 63.5 107.95 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a7e4e6")
		(property "Reference" "#PWR0104"
			(at 63.5 114.3 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 63.627 112.3442 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 63.5 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 63.5 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 63.5 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "d29dbb23-8a1d-46e1-abf4-480d33dde895")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0104")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+5V")
		(at 100.33 101.6 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a82d03")
		(property "Reference" "#PWR0106"
			(at 100.33 105.41 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5V"
			(at 100.711 97.2058 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 100.33 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 100.33 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 100.33 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "412e396b-eb2e-4b9f-b066-15bcfb823776")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0106")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 120.65 125.73 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a832d6")
		(property "Reference" "#PWR0107"
			(at 120.65 132.08 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 120.777 130.1242 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 120.65 125.73 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 120.65 125.73 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 120.65 125.73 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "0b53bb41-b445-445d-923c-7d708d6ef57a")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0107")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+3.3V")
		(at 120.65 115.57 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a8381b")
		(property "Reference" "#PWR0108"
			(at 120.65 119.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3V"
			(at 121.031 111.1758 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 120.65 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 120.65 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 120.65 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "076aff60-cc62-42d5-a8b6-71e3da9531de")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0108")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector_Generic:Conn_01x04")
		(at 83.82 146.05 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061c9ddb1")
		(property "Reference" "J7"
			(at 85.852 146.2532 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Conn_01x04"
			(at 85.852 148.5646 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "ModifiedSymbols:PinHoles_1x04_P2.54mm_NoSilk"
			(at 83.82 146.05 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 83.82 146.05 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 83.82 146.05 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "5d0216fc-d778-49ea-9dc4-61d4deee2959")
		)
		(pin "4"
			(uuid "f75b667a-926a-41c7-8edf-9c798dc85a55")
		)
		(pin "3"
			(uuid "ad7e5d79-d7a9-497d-9f6b-f7cabb55dd09")
		)
		(pin "1"
			(uuid "26f019ae-104f-40d9-bcd2-39f549cf17ed")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "J7")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+12V")
		(at 78.74 138.43 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061ca0d35")
		(property "Reference" "#PWR0111"
			(at 78.74 142.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+12V"
			(at 79.121 134.0358 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 78.74 138.43 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 78.74 138.43 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 78.74 138.43 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "8b1867db-afbe-4d60-add2-409d22528120")
		)
		(instances
			(project ""
				(path "/18e69150-85a7-46a5-9daf-162535eb3a75"
					(reference "#PWR0111")
					(unit 1)
				)
			)
		)
	)
	(sheet_instances
		(path "/"
			(page "1")
		)
	)
	(embedded_fonts no)
)

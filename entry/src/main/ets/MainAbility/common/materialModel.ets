namespace MaterialModel {
	export class Model {
		private title: string = ''
		private titleFontSize: number | string = 14
		private placeholder: string = 'Select'
		private height: number | string = 60
		private width: number | string = 100
		private fontSize: number | string = 18
		private fontColor: string | Color = '#333F48'
		private backgroundColor: string | Color = Color.White
		private borderWidth: number | string = 1
		private borderRadius: number | string = 4
		private borderColor: string | Color = '#9CA2C7'
		private unselectedColor: string | Color = Color.White
		private selectedColor: string | Color = '#F0F3FF'
		private padding: Padding | Length = 10
		private margin: Margin | Length = 0

		constructor(title: string, placeholder?: string) {
			if(title != null || title != undefined) {
				this.title = title
			}
			if(placeholder != null || placeholder != undefined) {
				this.placeholder = placeholder
			}
		}

		getTitle(): string {
			return this.title
		}

		setPlaceholder(placeholder: string): Model {
			if(placeholder == null || placeholder == undefined) {
				this.placeholder = ''
				return this
			}
			this.placeholder = placeholder
			return this
		}
		getPlaceholder(): string {
			return this.placeholder
		}

		setTitleFontSize(titleFontSize: number | string): Model {
			if(titleFontSize == null || titleFontSize == undefined) {
				this.titleFontSize = 14
				return this
			}
			this.titleFontSize = titleFontSize
			return this
		}
		getTitleFontSize(): number | string {
			return this.titleFontSize
		}

		setHeight(height: number | string): Model {
			if(height == null || height == undefined) {
				this.height = 60
				return this
			}
			this.height = height
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): Model {
			if(width == null || width == undefined) {
				this.width = 120
				return this
			}
			this.width = width
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setFontSize(fontSize: number | string): Model {
			if(fontSize == null || fontSize == undefined) {
				this.fontSize = 18
				return this
			}
			this.fontSize = fontSize
			return this
		}
		getFontSize(): number | string {
			return this.fontSize
		}

		setFontColor(fontColor: string | Color): Model {
			if(fontColor == null || fontColor == undefined) {
				this.fontColor = '#333F48'
				return this
			}
			this.fontColor = fontColor
			return this
		}
		getFontColor(): string | Color {
			return this.fontColor
		}

		setBackgroundColor(backgroundColor: string | Color): Model {
			if(backgroundColor == null || backgroundColor == undefined) {
				this.backgroundColor = Color.White
				return this
			}
			this.backgroundColor = backgroundColor
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setBorderWidth(borderWidth: number | string): Model {
			if(borderWidth == null || borderWidth == undefined) {
				this.borderWidth = 1
				return this
			}
			this.borderWidth = borderWidth
			return this
		}
		getBorderWidth(): number | string {
			return this.borderWidth
		}

		setBorderRadius(borderRadius: number | string): Model {
			if(borderRadius == null || borderRadius == undefined) {
				this.borderRadius = 4
				return this
			}
			this.borderRadius = borderRadius
			return this
		}
		getBorderRadius(): number | string {
			return this.borderRadius
		}

		setBorderColor(borderColor: string | Color): Model {
			if(borderColor == null || borderColor == undefined) {
				this.borderColor = '#9CA2C7'
				return this
			}
			this.borderColor = borderColor
			return this
		}
		getBorderColor(): string | Color {
			return this.borderColor
		}

		setUnselectedColor(unselectedColor: string | Color): Model {
			if(unselectedColor == null || unselectedColor == undefined) {
				this.unselectedColor = Color.White
				return this
			}
			this.unselectedColor = unselectedColor
			return this
		}
		getUnselectedColor(): string | Color {
			return this.unselectedColor
		}

		setSelectedColor(selectedColor: string | Color): Model {
			if(selectedColor == null || selectedColor == undefined) {
				this.selectedColor = '#F0F3FF'
				return this
			}
			this.selectedColor = selectedColor
			return this
		}
		getSelectedColor(): string | Color {
			return this.selectedColor
		}

		setPadding(padding: Margin | Length): Model {
			if(padding == null || padding == undefined) {
				this.padding = 10
				return this
			}
			this.padding = padding
			return this
		}
		getPadding(): Padding | Length {
			return this.padding
		}

		setMargin(margin: Margin | Length): Model {
			if(margin == null || margin == undefined) {
				this.margin = 0
				return this
			}
			this.margin = margin
			return this
		}
		getMargin(): Margin | Length {
			return this.margin
		}
	}

	export class MenuModel {
		private height: number | string = 40
		private width: number | string = 150
		private fontSize: number | string = 14
		private fontColor: string | Color = '#333F48'
		private backgroundColor: string | Color = Color.White
		private borderRadius: number | string = 0
		private padding: Padding  | Length = 10

		setHeight(height: number | string): MenuModel {
			if(height == null || height == undefined) {
				this.height = 40
				return this
			}
			this.height = height
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): MenuModel {
			if(width == null || width == undefined) {
				this.width = 150
				return this
			}
			this.width = width
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setFontSize(fontSize: number | string): MenuModel {
			if(fontSize == null || fontSize == undefined) {
				this.fontSize = 14
				return this
			}
			this.fontSize = fontSize
			return this
		}
		getFontSize(): number | string {
			return this.fontSize
		}

		setFontColor(fontColor: string | Color): MenuModel {
			if(fontColor == null || fontColor == undefined) {
				this.fontColor = '#333F48'
				return this
			}
			this.fontColor = fontColor
			return this
		}
		getFontColor(): string | Color {
			return this.fontColor
		}

		setBackgroundColor(backgroundColor: string | Color): MenuModel {
			if(backgroundColor == null || backgroundColor == undefined) {
				this.backgroundColor = Color.White
				return this
			}
			this.backgroundColor = backgroundColor
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setBorderRadius(borderRadius: number | string): MenuModel {
			if(borderRadius == null || borderRadius == undefined) {
				this.borderRadius = 0
				return this
			}
			this.borderRadius = borderRadius
			return this
		}
		getBorderRadius(): number | string {
			return this.borderRadius
		}

		setPadding(padding: Margin | Length): MenuModel {
			if(padding == null || padding == undefined) {
				this.padding = 10
				return this
			}
			this.padding = padding
			return this
		}
		getPadding(): Padding | Length {
			return this.padding
		}
	}

	export class MultipleMenuModel extends MenuModel {
		private checkColor: string | Color = Color.Blue
		private checkBoxHeight: number | string = 24
		private checkBoxWidth: number | string = 24

		setCheckColor(checkColor: string | Color): MultipleMenuModel {
			if(checkColor == null || checkColor == undefined) {
				this.checkColor = Color.Blue
				return this
			}
			this.checkColor = checkColor
			return this
		}
		getCheckColor(): string | Color {
			return this.checkColor
		}

		setCheckBoxHeight(checkBoxHeight: number | string): MultipleMenuModel {
			if(checkBoxHeight == null || checkBoxHeight == undefined) {
				this.checkBoxHeight = 24
				return this
			}
			this.checkBoxHeight = checkBoxHeight
			return this
		}
		getCheckBoxHeight(): number | string {
			return this.checkBoxHeight
		}

		setCheckBoxWidth(checkBoxWidth: number | string): MultipleMenuModel {
			if(checkBoxWidth == null || checkBoxWidth == undefined) {
				this.checkBoxWidth = 24
				return this
			}
			this.checkBoxHeight = checkBoxWidth
			return this
		}
		getCheckBoxWidth(): number | string {
			return this.checkBoxWidth
		}
	}

	export class DotModel {
		private height: number | string = 24
		private width: number | string = 24
		private backgroundColor: string | Color = Color.White
		private margin: Margin | Length = 0

		setHeight(height: number | string): DotModel {
			if(height == null || height == undefined) {
				this.height = 24
				return this
			}
			this.height = height
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): DotModel {
			if(width == null || width == undefined) {
				this.width = 24
				return this
			}
			this.width = width
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setBackgroundColor(backgroundColor: string | Color): DotModel {
			if(backgroundColor == null || backgroundColor == undefined) {
				this.backgroundColor = Color.White
				return this
			}
			this.backgroundColor = backgroundColor
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setMargin(margin: Margin | Length): DotModel {
			if(margin == null || margin == undefined) {
				this.margin = 0
				return this
			}
			this.margin = margin
			return this
		}
		getMargin(): Margin | Length {
			return this.margin
		}
	}

	export class DotMenuModel extends MenuModel{
		private iconHeight: number | string = 18
		private iconWidth: number | string = 18

		setIconHeight(iconHeight: number | string): DotMenuModel {
			if(iconHeight == null || iconHeight == undefined) {
				this.iconHeight = 18
				return this
			}
			this.iconHeight = iconHeight
			return this
		}
		getIconHeight(): number | string {
			return this.iconHeight
		}

		setIconWidth(iconWidth: number | string): DotMenuModel {
			if(iconWidth == null || iconWidth == undefined) {
				this.iconWidth = 18
				return this
			}
			this.iconWidth = iconWidth
			return this
		}
		getIconWidth(): number | string {
			return this.iconWidth
		}
	}
}

export { MaterialModel }
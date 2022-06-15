export class Properties {
	private title: string = ""
	private titleFontSize: number | string = 14
	private titleFontColor: string | Resource = '#333F48'
	private height: number | string = 60
	private width: number | string = 100
	private backgroundColor: string | Color = Color.White
	private borderWidth: number | string = 1
	private borderRadius: number | string = 4
	private borderColor: string | Color = '#9CA2C7'
	private unselectedColor: string | Color = Color.White
	private selectedColor: string | Color = '#F0F3FF'
	private padding: Padding | Length = 10
	private margin: Margin | Length = 0

	constructor(title: string) {
		if (title != null && title != undefined) {
			this.title = title
		}
	}

	setTitle(title: string): Properties {
		if (title == null || title == undefined) {
			this.title = ''
			return this
		}
		this.title = title
		return this
	}

	getTitle(): string {
		return this.title
	}

	setTitleFontSize(titleFontSize: number | string): Properties {
		if (titleFontSize == null || titleFontSize == undefined) {
			this.titleFontSize = 14
			return this
		}
		this.titleFontSize = titleFontSize
		return this
	}

	getTitleFontSize(): number | string {
		return this.titleFontSize
	}

	setTitleFontColor(titleFontColor: string | Resource): Properties {
		if (titleFontColor == null || titleFontColor == undefined) {
			this.titleFontColor = '#333F48'
			return this
		}
		this.titleFontColor = titleFontColor
		return this
	}

	getTitleFontColor(): string | Resource {
		return this.titleFontColor
	}

	setHeight(height: number | string): Properties {
		if (height == null || height == undefined) {
			this.height = 60
			return this
		}
		this.height = height
		return this
	}

	getHeight(): number | string {
		return this.height
	}

	setWidth(width: number | string): Properties {
		if (width == null || width == undefined) {
			this.width = 120
			return this
		}
		this.width = width
		return this
	}

	getWidth(): number | string {
		return this.width
	}

	setBackgroundColor(backgroundColor: string | Color): Properties {
		if (backgroundColor == null || backgroundColor == undefined) {
			this.backgroundColor = Color.White
			return this
		}
		this.backgroundColor = backgroundColor
		return this
	}

	getBackgroundColor(): string | Color {
		return this.backgroundColor
	}

	setBorderWidth(borderWidth: number | string): Properties {
		if (borderWidth == null || borderWidth == undefined) {
			this.borderWidth = 1
			return this
		}
		this.borderWidth = borderWidth
		return this
	}

	getBorderWidth(): number | string {
		return this.borderWidth
	}

	setBorderRadius(borderRadius: number | string): Properties {
		if (borderRadius == null || borderRadius == undefined) {
			this.borderRadius = 4
			return this
		}
		this.borderRadius = borderRadius
		return this
	}

	getBorderRadius(): number | string {
		return this.borderRadius
	}

	setBorderColor(borderColor: string | Color): Properties {
		if (borderColor == null || borderColor == undefined) {
			this.borderColor = '#9CA2C7'
			return this
		}
		this.borderColor = borderColor
		return this
	}

	getBorderColor(): string | Color {
		return this.borderColor
	}

	setUnselectedColor(unselectedColor: string | Color): Properties {
		if (unselectedColor == null || unselectedColor == undefined) {
			this.unselectedColor = Color.White
			return this
		}
		this.unselectedColor = unselectedColor
		return this
	}

	getUnselectedColor(): string | Color {
		return this.unselectedColor
	}

	setSelectedColor(selectedColor: string | Color): Properties {
		if (selectedColor == null || selectedColor == undefined) {
			this.selectedColor = '#F0F3FF'
			return this
		}
		this.selectedColor = selectedColor
		return this
	}

	getSelectedColor(): string | Color {
		return this.selectedColor
	}

	setPadding(padding: Margin | Length): Properties {
		if (padding == null || padding == undefined) {
			this.padding = 0
			return this
		}
		this.padding = padding
		return this
	}

	getPadding(): Padding | Length {
		return this.padding
	}

	setMargin(margin: Margin | Length): Properties {
		if (margin == null || margin == undefined) {
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

export class MenuProperties {
	private height: number = 40
	private width: number = 150
	private fontSize: number | string = 14
	private fontColor: string | Color = '#333F48'
	private backgroundColor: string | Color = Color.White
	private borderRadius: number | string = 0
	private padding: Padding | Length = 10

	setHeight(height: number): MenuProperties {
		if (height == null || height == undefined) {
			this.height = 40
			return this
		}
		if (height < 40) {
			this.height = 40
			return this
		}
		if (height > 200) {
			this.height = 200
			return this
		}
		this.height = height
		return this
	}

	getHeight(): number {
		return this.height
	}

	setWidth(width: number): MenuProperties {
		if (width == null || width == undefined) {
			this.width = 150
			return this
		}
		if (width < 50) {
			this.width = 50
			return this
		}
		if (width > 200) {
			this.width = 200
			return this
		}
		this.width = width
		return this
	}

	getWidth(): number {
		return this.width
	}

	setFontSize(fontSize: number | string): MenuProperties {
		if (fontSize == null || fontSize == undefined) {
			this.fontSize = 14
			return this
		}
		this.fontSize = fontSize
		return this
	}

	getFontSize(): number | string {
		return this.fontSize
	}

	setFontColor(fontColor: string | Color): MenuProperties {
		if (fontColor == null || fontColor == undefined) {
			this.fontColor = '#333F48'
			return this
		}
		this.fontColor = fontColor
		return this
	}

	getFontColor(): string | Color {
		return this.fontColor
	}

	setBackgroundColor(backgroundColor: string | Color): MenuProperties {
		if (backgroundColor == null || backgroundColor == undefined) {
			this.backgroundColor = Color.White
			return this
		}
		this.backgroundColor = backgroundColor
		return this
	}

	getBackgroundColor(): string | Color {
		return this.backgroundColor
	}

	setBorderRadius(borderRadius: number | string): MenuProperties {
		if (borderRadius == null || borderRadius == undefined) {
			this.borderRadius = 0
			return this
		}
		this.borderRadius = borderRadius
		return this
	}

	getBorderRadius(): number | string {
		return this.borderRadius
	}

	setPadding(padding: Margin | Length): MenuProperties {
		if (padding == null || padding == undefined) {
			this.padding = 0
			return this
		}
		this.padding = padding
		return this
	}

	getPadding(): Padding | Length {
		return this.padding
	}
}
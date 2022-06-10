export namespace MaterialModel {
	export class Model {
		height: number | string = 60
		width: number | string = 100
		fontSize: number | string = 18
		fontColor: string | Color = '#333F48'
		backgroundColor: string | Color = Color.White
		borderWidth: number | string = 1
		borderRadius: number | string = 4
		borderColor: string | Color = '#9CA2C7'
		// add functionality for selection color
		unselectedColor: string | Color = Color.White
		selectedColor: string | Color = '#F0F3FF'
	}

	export class MenuModel {
		height: number | string = 20
		width: number | string = 150
		fontSize: number | string = 14
		fontColor: string | Color = Color.Black
		backgroundColor: string | Color = Color.White
		borderRadius: number | string = 0
	}

	export class MultipleMenuModel extends MenuModel {
		selectedColor: string | Color = Color.Blue
		checkBoxHeight: number | string = 24
		checkBoxWidth: number | string = 24
	}

	export class DotModel {
		height: number | string = 24
		width: number | string = 24
		backgroundColor: string | Color = Color.White
		borderWidth: number | string = 1
		borderRadius: number | string = 4
		borderColor: string | Color = Color.Black
	}

	export class DotMenuModel extends MenuModel{
		iconHeight: number | string = 18
		iconWidth: number | string = 18
	}
}
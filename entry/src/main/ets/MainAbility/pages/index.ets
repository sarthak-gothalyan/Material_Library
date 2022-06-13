import {
    MaterialSelect,
    MenuOption,
    MultipleSelect,
    MultipleMenuOption,
    MaterialDotMenu,
	DotMenuOption
} from '../common/select'

import {
	MaterialModel
} from '../common/materialModel'

@Entry
@Component
struct Index {
	name: string = 'Industry'
	placeholder: string = 'select'
    selectMenu: MenuOption[] = []
    @State selection: MenuOption = {value: "", id: -1}
	selectModel: MaterialModel.Model = new MaterialModel.Model('Industry')
	selectMenuModel: MaterialModel.MenuModel = new MaterialModel.MenuModel()

	multipleSelectName: string = 'Use Case'
    multipleSelectMenu: MultipleMenuOption[] = []
    @State multiple_selection: MultipleMenuOption[] = []
	multipleSelectModel: MaterialModel.Model = new MaterialModel.Model('Use Case')
	multipleMenuModel: MaterialModel.MultipleMenuModel = new MaterialModel.MultipleMenuModel()

	dotModel: MaterialModel.DotModel = new MaterialModel.DotModel()
	dotMenuModel: MaterialModel.DotMenuModel = new MaterialModel.DotMenuModel()
	dotMenu: DotMenuOption[] = [
		{
			value: 'Preview',
			id: 0,
			icon: $r('app.media.preview'),
		},
		{
			value: 'Get Link',
			id: 1,
			icon: $r('app.media.get_link'),
		},
		{
			value: 'Download',
			id: 2,
			icon: $r('app.media.download'),
		},
		{
			value: 'Share',
			id: 3,
			icon: $r('app.media.share'),
		},
		{
			value: 'Preview',
			id: 0,
			icon: $r('app.media.preview'),
		},
	]

    aboutToAppear() {
		this.selectModel.setWidth(60)
		this.selectModel.setBackgroundColor(null)
		this.selectModel.setBorderColor(null)
		this.selectModel.setBorderRadius(null)
		this.selectModel.setBorderWidth(null)
		this.selectModel.setSelectedColor(null)
		this.selectMenuModel.setBorderRadius(null)
		this.selectMenuModel.setBackgroundColor(null)
		this.selectMenuModel.setFontSize(null)

		this.multipleSelectModel.setPlaceholder(null)
		this.multipleSelectModel.setBackgroundColor(null)
		this.multipleSelectModel.setBorderColor(null)
		this.multipleSelectModel.setBorderRadius(null)
		this.multipleSelectModel.setBorderWidth(null)
		this.multipleMenuModel.setFontSize(null)
		this.multipleMenuModel.setBackgroundColor(null)
		this.multipleMenuModel.setCheckBoxHeight(null)

		this.dotMenuModel.setBackgroundColor(null)
		this.dotMenuModel.setFontSize(null)
		this.dotMenuModel.setIconHeight(null)

        for(let i = 0; i <= 10; i++) {
            this.selectMenu.push({
                value: 'Option ' + i,
                id: i
            })
        }
        let options = [true, false, true, false, true, true]
        options.forEach((c, i) => {
            this.multipleSelectMenu.push({
                value: 'Option ' + i,
                id: i,
                isChecked: c
            })
        })
    }

    build() {
        Column({space: 10}) {
            Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center}) {
                Image($r('app.media.back')).height(24).width(24).objectFit(ImageFit.Contain)
                Text('Select Menus').fontSize(21).fontWeight(FontWeight.Bold)
                Image($r('app.media.categories')).height(24).width(24).objectFit(ImageFit.Contain)
            }
              .width('80%')
            Row({space: 10}) {
                MaterialSelect({
                    menu: this.selectMenu,
                    onSelect: (it: MenuOption) => {
                        console.log(it.value)
                    },
					model: this.selectModel
                })
                MultipleSelect({
                    menu: this.multipleSelectMenu,
                    onSelect: (itL: MultipleMenuOption[]) => {
						itL.forEach((it) => {
							console.log(it.value)
						})
					},
					model: this.multipleSelectModel,
					menuModel: this.multipleMenuModel
                })
            }
			Column({space: 10}) {
				Flex({justifyContent: FlexAlign.SpaceBetween}) {
					Text('File')
						.fontSize(18)
						.fontWeight(FontWeight.Bold)
					MaterialDotMenu({
						menu: this.dotMenu,
						onSelect: (it: DotMenuOption) => {
							console.log(it.id + ' ' + it.value)
						},
						model: this.dotModel,
						menuModel: this.dotMenuModel
					})
				}
				Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris accumsan mi ligula. Sed mollis augue vel dolor hendrerit maximus. Vestibulum mollis euismod ornare. Curabitur eleifend pretium fermentum. Donec eget ipsum sed felis ultricies iaculis in et dolor. Phasellus in velit efficitur, fermentum ante sed, volutpat sem. In tempus lobortis lacinia. Proin a tincidunt justo.')
					.fontSize(14)
					.fontColor('#9CA2C7')
					.maxLines(2)
					.textOverflow({overflow: TextOverflow.Ellipsis})
			}
				.width("80%")
				.padding(5)
				.borderWidth(1)
				.borderRadius(4)
        }
            .width('80%')
            .margin({left: 10, right: 10, top: 10, bottom: 10})
    }
}
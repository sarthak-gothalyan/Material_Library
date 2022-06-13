import {
    MaterialSelect,
    MenuOption,
    MultipleSelect,
    MultipleMenuOption,
    MaterialDotMenu,
	DotMenuOption,
	MaterialModel
} from '../common/select'

@Entry
@Component
struct Index {
	name: string = 'Industry'
	placeholder: string = 'select'
    selectMenu: MenuOption[] = []
    @State selection: MenuOption = new MenuOption(null, null)
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
//		new DotMenuOption(null, null),
//		new DotMenuOption(null, null, null),
		new DotMenuOption('Get Link', 1),
		new DotMenuOption('Download', 2, $r('app.media.download'))
	]

    aboutToAppear() {
		this.selectModel.setWidth(60)
		this.selectModel.setPadding(null)
		this.selectModel.setBackgroundColor(null)
		this.selectModel.setBorderColor(null)
		this.selectModel.setBorderRadius(null)
		this.selectModel.setBorderWidth(null)
		this.selectModel.setSelectedColor(null)
		this.selectMenuModel.setBorderRadius(null)
		this.selectMenuModel.setBackgroundColor(null)
		this.selectMenuModel.setFontSize(null)
		this.selectMenuModel.setPadding(null)
		this.selectModel.setMargin(null)

		this.multipleSelectModel.setWidth(null)
		this.multipleSelectModel.setPadding(null)
		this.multipleSelectModel.setHeight(null)
		this.multipleSelectModel.setPlaceholder(null)
		this.multipleSelectModel.setBackgroundColor(null)
		this.multipleSelectModel.setBorderColor(null)
		this.multipleSelectModel.setBorderRadius(null)
		this.multipleSelectModel.setBorderWidth(null)
		this.multipleMenuModel.setFontSize(null)
		this.multipleMenuModel.setBackgroundColor(null)
		this.multipleMenuModel.setCheckBoxHeight(null)
		this.multipleSelectModel.setMargin(null)

		this.dotMenuModel.setBackgroundColor(null)
		this.dotMenuModel.setFontSize(null)
		this.dotMenuModel.setIconHeight(null)
		this.dotMenuModel.setPadding(0)
		this.dotModel.setMargin(null)

        for(let i = 0; i <= 100; i++) {
            this.selectMenu.push(new MenuOption('Option ' + i, i))
        }
		this.selectMenu.push(new MenuOption(null, null))
        let options = [true, false, true, false, true, true, true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,]
        options.forEach((c, i) => {
            this.multipleSelectMenu.push(new MultipleMenuOption('Option ' + i, i, null))
        })
		this.multipleSelectMenu.push(new MultipleMenuOption(null, null))
		this.multipleSelectMenu.push(new MultipleMenuOption(null, null, null))
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
                        console.log(it.getValue())
                    },
					model: this.selectModel
                })
                MultipleSelect({
                    menu: this.multipleSelectMenu,
                    onSelect: (itL: MultipleMenuOption[]) => {
						itL.forEach((it) => {
							console.log(it.getValue())
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
							console.log(it.getId() + ' ' + it.getValue())
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
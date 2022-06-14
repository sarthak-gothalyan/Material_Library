import {
	MaterialSelect,
	MenuOption,
	MultipleSelect,
	MultipleMenuOption,
	MaterialDotMenu,
	DotMenuOption,
	MaterialModel,
} from '../common/select'

@Entry
@Component
struct Index {
	name: string = 'Industry'
	placeholder: string = 'select'
	selectMenu: MenuOption[] = []
	selection: MenuOption = new MenuOption(null, null)
	selectModel: MaterialModel.SingleSelectModel = new MaterialModel.SingleSelectModel('Industry')
	selectMenuModel: MaterialModel.MenuModel = new MaterialModel.MenuModel()

	multipleSelectName: string = 'Use Case'
	multipleSelectMenu: MultipleMenuOption[] = []
	multipleSelectModel: MaterialModel.MultipleSelectModel = new MaterialModel.MultipleSelectModel('Use Case')
	multipleMenuModel: MaterialModel.MultipleMenuModel = new MaterialModel.MultipleMenuModel()

	dotModel: MaterialModel.DotModel = new MaterialModel.DotModel()
	dotMenuModel: MaterialModel.DotMenuModel = new MaterialModel.DotMenuModel()
	dotMenu: DotMenuOption[] = [
		new DotMenuOption('Download', 2, $r('app.media.download')),
		new DotMenuOption('Download', 2, $r('app.media.download')),
		new DotMenuOption('Download', 2, $r('app.media.download')),
		new DotMenuOption(null, null),
		new DotMenuOption(null, null, null),
		new DotMenuOption(null, 1),
		new DotMenuOption('Download', null),
		new DotMenuOption('Download', null, null),
		new DotMenuOption(null, null, $r('app.media.download')),
		new DotMenuOption(null, 2, null),
	]

	aboutToAppear() {
		this.selectModel.setTitle(null)
		this.selectModel.setTitleFontSize(null)
		this.selectModel.setTitleFontColor(null)
		this.selectModel.setHeight(null)
		this.selectModel.setWidth(null)
		this.selectModel.setBackgroundColor(null)
		this.selectModel.setBorderWidth(null)
		this.selectModel.setBorderRadius(null)
		this.selectModel.setBorderColor(null)
		this.selectModel.setUnselectedColor(null)
		this.selectModel.setPadding(null)
		this.selectModel.setFontSize(null)
		this.selectModel.setMargin(null)

		this.selectModel.setPlaceholder(null)
		this.selectModel.setFontSize(null)
		this.selectModel.setFontColor(null)

		this.multipleSelectModel.setTitle(null)
		this.multipleSelectModel.setTitleFontSize(null)
		this.multipleSelectModel.setTitleFontColor(null)
		this.multipleSelectModel.setHeight(null)
		this.multipleSelectModel.setWidth(null)
		this.multipleSelectModel.setBackgroundColor(null)
		this.multipleSelectModel.setBorderWidth(null)
		this.multipleSelectModel.setBorderRadius(null)
		this.multipleSelectModel.setBorderColor(null)
		this.multipleSelectModel.setUnselectedColor(null)
		this.multipleSelectModel.setPadding(null)
		this.multipleSelectModel.setMargin(null)

		this.dotModel.setHeight(null)
		this.dotModel.setWidth(null)
		this.dotModel.setBackgroundColor(null)
		this.dotModel.setMargin(null)

		this.selectMenuModel.setHeight(null)
		this.selectMenuModel.setWidth(null)
		this.selectMenuModel.setFontSize(null)
		this.selectMenuModel.setFontColor(null)
		this.selectMenuModel.setBackgroundColor(null)
		this.selectMenuModel.setBorderRadius(null)
		this.selectMenuModel.setPadding(null)

		this.multipleMenuModel.setHeight(null)
		this.multipleMenuModel.setWidth(null)
		this.multipleMenuModel.setFontSize(null)
		this.multipleMenuModel.setFontColor(null)
		this.multipleMenuModel.setBackgroundColor(null)
		this.multipleMenuModel.setBorderRadius(null)
		this.multipleMenuModel.setPadding(null)

		this.multipleMenuModel.setCheckColor(null)
		this.multipleMenuModel.setCheckBoxHeight(null)
		this.multipleMenuModel.setCheckBoxWidth(null)

		this.dotMenuModel.setHeight(null)
		this.dotMenuModel.setWidth(null)
		this.dotMenuModel.setFontSize(null)
		this.dotMenuModel.setFontColor(null)
		this.dotMenuModel.setBackgroundColor(null)
		this.dotMenuModel.setBorderRadius(null)
		this.dotMenuModel.setPadding(null)

		this.dotMenuModel.setIconHeight(null)
		this.dotMenuModel.setIconWidth(null)

		this.dotMenu[0].setValue(null)
		this.dotMenu[1].setId(null)
		this.dotMenu[2].setIcon(null)

		for (let i = 0; i <= 5; i++) {
			this.selectMenu.push(new MenuOption('Option ' + i, i))
		}

		this.selectMenu[0].setValue(null)
		this.selectMenu[1].setId(null)

		this.selectMenu.push(new MenuOption(null, null))
		this.selectMenu.push(new MenuOption("a", null))
		this.selectMenu.push(new MenuOption(null, 50))

		let options = [true, false, true, false, true,]
		options.forEach((c, i) => {
			this.multipleSelectMenu.push(new MultipleMenuOption('Option ' + i, i, c))
		})

		this.multipleSelectMenu[0].setValue(null)
		this.multipleSelectMenu[1].setId(null)
		this.multipleSelectMenu[2].setChecked(null)

		this.multipleSelectMenu.push(new MultipleMenuOption(null, null))
		this.multipleSelectMenu.push(new MultipleMenuOption(null, null, null))
		this.multipleSelectMenu.push(new MultipleMenuOption("a", null))
		this.multipleSelectMenu.push(new MultipleMenuOption(null, 10))
		this.multipleSelectMenu.push(new MultipleMenuOption("a", null, null))
		this.multipleSelectMenu.push(new MultipleMenuOption(null, 11, null))
		this.multipleSelectMenu.push(new MultipleMenuOption(null, null, false))
	}

	build() {
		Column({ space: 10 }) {
			Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
				Image($r('app.media.back')).height(24).width(24).objectFit(ImageFit.Contain)
				Text('Select Menus').fontSize(21).fontWeight(FontWeight.Bold)
				Image($r('app.media.categories')).height(24).width(24).objectFit(ImageFit.Contain)
			}
			.width('80%')

			Row({ space: 10 }) {
				MaterialSelect({
					menu: [
						new MenuOption("Option 1", 1),
						new MenuOption("Option 2", 2),
						new MenuOption("Option 3", 3),
					],
					onSelect: (it: MenuOption) => {
						console.log(it.getValue())
					},
					model: new MaterialModel.SingleSelectModel("Single Select"),
					menuModel: new MaterialModel.MenuModel(),
				})
				MultipleSelect({
					menu: [
						new MultipleMenuOption("Option 1", 1),
						new MultipleMenuOption("Option 2", 2, true),
						new MultipleMenuOption("Option 3", 3),
					],
					onSelect: (itL: MultipleMenuOption[]) => {
						itL.forEach((it) => {
							console.log(it.getValue())
						})
					},
					model: new MaterialModel.MultipleSelectModel("Multiple Select"),
					menuModel: new MaterialModel.MultipleMenuModel()
				})
			}

			Column({ space: 10 }) {
				Flex({ justifyContent: FlexAlign.SpaceBetween }) {
					Text('File')
						.fontSize(18)
						.fontWeight(FontWeight.Bold)
					MaterialDotMenu({
						menu: [
							new DotMenuOption("Preview", 1, $r('app.media.preview')),
							new DotMenuOption("Download", 2, $r('app.media.download')),
							new DotMenuOption("Remove", 3, $r('app.media.remove'))
						],
						onSelect: (it: DotMenuOption) => {
							console.log(it.getId() + ' ' + it.getValue())
						},
						model: new MaterialModel.DotModel(),
						menuModel: new MaterialModel.DotMenuModel()
					})
				}

				Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris accumsan mi ligula. Sed mollis augue vel dolor hendrerit maximus. Vestibulum mollis euismod ornare. Curabitur eleifend pretium fermentum. Donec eget ipsum sed felis ultricies iaculis in et dolor. Phasellus in velit efficitur, fermentum ante sed, volutpat sem. In tempus lobortis lacinia. Proin a tincidunt justo.')
					.fontSize(14)
					.fontColor('#9CA2C7')
					.maxLines(2)
					.textOverflow({ overflow: TextOverflow.Ellipsis })
			}
			.width("80%")
			.padding(5)
			.borderWidth(1)
			.borderRadius(4)
		}
		.width('80%')
		.margin({ left: 10, right: 10, top: 10, bottom: 10 })
	}
}
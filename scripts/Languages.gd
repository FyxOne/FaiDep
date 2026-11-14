extends Node

var strings = {
	"ru": {
		"next": "Далее",
		"back": "Назад",
		"time": "Время: ",
		"menu": "Меню",
		
		"menu_play": "Играть",
		"menu_lore": "Лор игры",
		"menu_settings": "Настройки",
		
		"lore_history": "История",
		"lore_dossier": "Досье",
		"lore_organization": "Организация",
		
		"lore_historyLabel": "1970-е. Альтернативный мир, в котором нет религии. Вместо нее - магия, которую изучают как науку. Церковь здесь не храм, а организация, занимающаяся изучением этой науки. Священники - ученые, работающие на церковь. Экзорцизм - прикладная дисциплина вроде хирургии, но для души. Главный герой - экзорцист, который изгоняет из людей демонов.
		
			Когда человек теряет веру (не в Бога - религии нет, а в себя, в людей, в будущее), он впадает в отчаяние. Тогда в его сознании начинает говорить голос. Он звучит как его собственный, но он не принадлежит ему. Это состояние можно сравнить с шизофренией. Голос обещает избавление, выход, покой. И человек добровольно соглашается.
		
			Этот голос принадлежит дьяволу. Его цель - заполучить душу человека. Такое явление называется \"Феномен сделки\". При нем человек становится одержимым демоном.
		
			Церковь точно не знает, почему это происходит. Официально это считается психическим расстройством. В народе ходят слухи о продаже души.
		
			Работа экзорцистов заключается в изгнании демона из разума одержимого путём прямого воздействия на подсознание человека. Процесс изгнания демона называется осадой.",
		
		"lore_dossierLabel": "Имя: Войд Люмен
			Возраст: 27 лет
			Должность: Священник
			Направление: Экзорцизм",
		
		"lore_dossierInfoLabel": "Внешность: лицо суровое, но не злое. Глаза уставшие, есть лёгкая щетина. Одет в рубашку и поношенный плащ . Галстук всегда ослаблен, верхняя пуговица рубашки расстегнута. Во время осады принимает образ чумного доктора.
		
			Характер: серьезный, но не мрачный. В работе холоден и расчетлив. Страха не показывает, даже когда внутри все идет не по плану. Чувство юмора ироничное.
			
			Особенности: курит дешевые сигареты. Не берет денег за осаду. Считает, что каждый имеет право на помощь. Жизнь других приоритетнее собственной.
			
			Примечание: любит гранатовый сок",
			
		"lore_organizationLabel": "Название: Церковь
			Тип: Научно-исследовательская организация
			Основана: неизвестно
			Статус: действует",
			
		"lore_organizationInfoLabel": "Церковь - не религиозное учреждение, а научно-исследовательская организация. Её главная задача - изучение магии и применение этих знаний на практике.
		
			На данный момент церковь сосредоточена на устранении угрозы, а не на поиске её первопричин. Феномен сделки остаётся необъяснённым, но это не мешает бороться с его последствиями.
			
			Экзорцисты работают на выездах. Они прибывают к одержимому на дом, проводят осаду и уезжают. Это опасная работа, так как в случае провала экзорцист сам становится одержимым. Его либо пытаются вылечить, либо сжигают на костре.
			
			Люмен Войд - один из действующих экзорцистов. Он работает безвозмездно, что вызывает у церкви вопросы. Но его не трогают, так как он считается почётным работником.",
			
		"settings_header": "Настройки",
		"settings_volume": "Громкость",
		"settings_mode": "Режим игры",
		"settings_words": "Слов на странице",
		"settings_language": "Язык",
		"settings_default": "Обычный",
		"settings_lite": "Упрощённый",
		
		"intro_book": "НОВЫЙ ЗАКАЗ

			Исполнитель: Войд Люмен
			Цель: Осада
			Пациент: #####
			Местоположение: #####
			Примечание: #####",
		"intro_accept": "Принять",
		"intro_reject": "Отклонить",
		"intro_texts": [
			"В кабинете тихо. Только лампа гудит и страницы шуршат.",
			"Люмен читает уже второй час. Или третий. Работа экзорциста - это не только выезды. Это ещё и ожидание.",
			"Он уже хотел закрыть книгу, как телефон на тумбочке зазвонил. Звон разорвал тишину. Войд снял трубку.",
			"- Люмен слушает.",
			"Голос на том конце произнёс адрес. Коротко. Без объяснений. Без имени пациента. Без подробностей.",
			"- Принято.",
			"Войд положил трубку и открыл книгу. На чистой странице записал данные о вызове."],
			
		"arrival_texts1": [
			"Ночь. Дорога пустая, машин нет. Только фары светят вперёд. За окнами - темнота.",
			"Войд за рулём, смотрит на дорогу. Он уже ездил по этому адресу. Не в этот дом, но в похожие. Каждый раз одно и то же.",
			"Дом появляется внезапно. Одноэтажный, старый, окна тёмные.",
			"Войд останавливается и выключает двигатель.",
			"Он берёт сумку с книгой с пассажирского сиденья, закрывает дверь машины и идёт к дому. Дверь не заперта. Он заходит.",
			"Внутри темно и тихо. Только лампа на тумбочке у кровати горит, но свет от неё слабый, почти не разгоняет темноту. Люмен останавливается у входа, осматривается."],
		"arrival_texts2": [
			"На кровати лежит человек. Его тело окутано чёрным туманом. Густым, плотным.",
			"Он не двигается, но он живой, дышит, и туман колышется в такт дыханию. На месте глаз - два светящихся пятна.",
			"Он медленно подходит ближе, останавливается в паре шагов от кровати. Смотрит на пятна. Пятна смотрят на него.",
			"- Пожалуй, начнём"],
		
		"patient_death": "Пациент скончался.",
		"retry": "Заново",
		"startSiege_texts": [
			"Люмен садится на стул у кровати и открывает книгу на нужной странице.",
			"В книге написано заклинание. Его нужно читать вслух с определённой скоростью - не слишком быстро и не слишком медленно. От этого зависит пульс пациента.",
			"Если скорость будет правильной - пульс останется ровным, и Люмен сможет войти в подсознание.",
			"Если нет - пациент умрёт.",
			"Люмен делает глубокий вдох и начинает."],
			
		"mind_fall_texts": [
			"Люмен падает в пустоту. За спиной огромные крылья. Они держат его, но едва.",
			"Крылья начинают распадаться. С них слетают перья, растворяясь в воздухе. Вокруг Люмена появляются частицы ткани.",
			"Крылья почти исчезли. На плечах Люмена появляется длинный плащ. Лицо скрывается под маской.",
			"От крыльев остались только обрывки. Люмен почти полностью покрыт костюмом чумного доктора. Он падает быстрее.",
			"Жёсткое приземление. Люмен врезается в землю.",
			"Он поднимается. Вокруг него пространство подсознания.",
			"Здесь ему предстоит сражаться."],
		
		"attack": "Атака",
		"clean": "Очистка",
		"repair": "Починка",
		"siege_texts": [
			"Теперь ты внутри подсознания пациента. Перед тобой демон. Твоя задача - очистить разум пациента от заражения.",
			"Маска Люмена защищает его разум от потери рассудка. От воздействия среды маска понемногу теряет прочность",
			"Если маска разрушится, то Люмен начнёт терять рассудок, и его разумом овладеет демон.",
			"Убить демона невозможно, но можно оглушить. Пока демон в сознании, то он атакует Люмена. Каждая атака снимает прочность маски.",
			"В книге три раздела заклинаний:",
			"Атака - на время оглушает демона.",
			"Очищение - чистит разум пациента от заражения.",
			"Починка - восстанавливает маску.",
			"Удачи."],
			
		"death": "СМЕРТЬ",
		"siege_unsuccess": "Рассудок Люмена упал и демон завладел его разумом.
		Инквизиция сожгла Войда на костре вместе с его пациентом.",
		
		"victory": "ПОБЕДА",
		"siege_success": "Осада проведена."
	},
	"en": {
		"next": "Next",
		"back": "Back",
		"time": "Time: ",
		"menu": "Menu",
		
		"menu_play": "Play",
		"menu_lore": "Lore",
		"menu_settings": "Settings",
		
		"lore_history": "History",
		"lore_dossier": "Dossier",
		"lore_organization": "Organization",
		
		"lore_historyLabel": "1970s. An alternative world where religion does not exist. Instead of it - magic, which is studied as a science. The Church here is not a temple, but an organization engaged in the study of this science. Priests are scientists working for the Church. Exorcism is an applied discipline like surgery, but for the soul. The main character is an exorcist who casts demons out of people.
		
			When a person loses faith (not in God - there is no religion, but in himself, in people, in the future), he falls into despair. Then a voice begins to speak in his mind. It sounds like his own, but it does not belong to him. This state can be compared to schizophrenia. The voice promises deliverance, a way out, peace. And the person voluntarily agrees.
		
			This voice belongs to the devil. His goal is to obtain the human soul. This phenomenon is called the \"Deal Phenomenon\". With it, a person becomes possessed by a demon.
		
			The Church does not know exactly why this happens. Officially, it is considered a mental disorder. Among the people, there are rumors about selling the soul.
		
			The work of exorcists consists in expelling the demon from the mind of the possessed by direct influence on the human subconscious. The process of expelling the demon is called a siege.",
		
		"lore_dossierLabel": "Name: Void Lumen
			Age: 27
			Position: Priest
			Field: Exorcism",
		
		"lore_dossierInfoLabel": "Appearance: stern face, but not evil. Tired eyes, light stubble. Dressed in a shirt and a worn coat. His tie is always loosened, the top button of his shirt is unbuttoned. During a siege, he takes on the image of a plague doctor.
		
			Character: serious, but not gloomy. Cold and calculating at work. He doesn't show fear, even when everything inside is going wrong. His sense of humor is ironic.
			
			Traits: smokes cheap cigarettes. Doesn't take money for a siege. Believes that everyone has the right to help. The lives of others are a priority over his own.
			
			Note: loves pomegranate juice",
			
		"lore_organizationLabel": "Name: The Church
			Type: Research organization
			Founded: unknown
			Status: active",
			
		"lore_organizationInfoLabel": "The Church is not a religious institution, but a research organization. Its main task is the study of magic and the application of this knowledge in practice.
		
			At the moment, the Church is focused on eliminating the threat, not on finding its root causes. The Deal Phenomenon remains unexplained, but this does not prevent fighting its consequences.
			
			Exorcists work on calls. They arrive at the possessed person's home, perform a siege, and leave. It is a dangerous job, because in case of failure, the exorcist himself becomes possessed. He is either tried to be cured or burned at the stake.
			
			Void Lumen is one of the active exorcists. He works without payment, which raises questions from the Church. But they leave him alone, as he is considered an honorary worker.",
			
		"settings_header": "Settings",
		"settings_volume": "Volume",
		"settings_mode": "Game mode",
		"settings_words": "Words per page",
		"settings_language": "Language",
		"settings_default": "Default",
		"settings_lite": "Lite",
		
		"intro_book": "NEW ORDER

			Executor: Void Lumen
			Goal: Siege
			Patient: #####
			Location: #####
			Note: #####",
		"intro_accept": "Accept",
		"intro_reject": "Decline",
		"intro_texts": [
			"The office is quiet. Only the lamp hums and the pages rustle.",
			"Lumen has been reading for two hours. Or three. The work of an exorcist is not only calls. It's also waiting.",
			"He was about to close the book when the phone on the nightstand rang. The ring broke the silence. Void picked up.",
			"- Lumen speaking.",
			"The voice on the other end said an address. Briefly. Without explanations. Without the patient's name. Without details.",
			"- Accepted.",
			"Void put down the phone and opened the book. On a clean page, he wrote down the call details."],
			
		"arrival_texts1": [
			"Night. The road is empty, no cars. Only the headlights shine forward. Outside the windows - darkness.",
			"Void is driving, looking at the road. He has already driven to this address. Not this house, but similar ones. Every time the same thing.",
			"The house appears suddenly. One-story, old, windows dark.",
			"Void stops and turns off the engine.",
			"He takes the bag with the book from the passenger seat, closes the car door and walks to the house. The door is unlocked. He enters.",
			"Inside it is dark and quiet. Only the lamp on the nightstand by the bed is on, but its light is weak, almost not dispelling the darkness. Lumen stops at the entrance, looks around."],
		"arrival_texts2": [
			"A man lies on the bed. His body is shrouded in black fog. Thick, dense.",
			"He does not move, but he is alive, breathing, and the fog sways to the rhythm of his breathing. Where the eyes should be - two glowing spots.",
			"He slowly approaches, stops a couple of steps from the bed. Looks at the spots. The spots look at him.",
			"- Let's begin"],
		
		"patient_death": "The patient has died.",
		"retry": "Retry",
		"startSiege_texts": [
			"Lumen sits down on a chair by the bed and opens the book to the right page.",
			"The book contains a spell. It must be read aloud at a certain speed - not too fast and not too slow. The patient's pulse depends on it.",
			"If the speed is correct - the pulse will remain steady, and Lumen will be able to enter the subconscious.",
			"If not - the patient will die.",
			"Lumen takes a deep breath and begins."],
			
		"mind_fall_texts": [
			"Lumen falls into the void. Behind him are huge wings. They hold him, but barely.",
			"The wings begin to crumble. Feathers fly off them, dissolving in the air. Particles of fabric appear around Lumen.",
			"The wings have almost disappeared. A long coat appears on Lumen's shoulders. His face is hidden under a mask.",
			"Only scraps remain of the wings. Lumen is almost completely covered by the plague doctor suit. He falls faster.",
			"A hard landing. Lumen crashes into the ground.",
			"He gets up. Around him is the space of the subconscious.",
			"Here he will have to fight."],
		
		"attack": "Attack",
		"clean": "Cleanse",
		"repair": "Repair",
		"siege_texts": [
			"Now you are inside the patient's subconscious. Before you is a demon. Your task is to cleanse the patient's mind of the infection.",
			"Lumen's mask protects his mind from losing sanity. From the environment, the mask gradually loses durability.",
			"If the mask is destroyed, Lumen will begin to lose sanity, and the demon will take over his mind.",
			"It is impossible to kill the demon, but it can be stunned. While the demon is conscious, it attacks Lumen. Each attack reduces the mask's durability.",
			"The book has three sections of spells:",
			"Attack - stuns the demon for a while.",
			"Cleanse - cleanses the patient's mind of infection.",
			"Repair - restores the mask.",
			"Good luck."],
			
		"death": "DEATH",
		"siege_unsuccess": "Lumen's sanity fell, and the demon seized his mind.
		The Inquisition burned Void alongside his patient.",
		
		"victory": "VICTORY",
		"siege_success": "The siege has been carried out."
	}
}

func t(key: String) -> String:
	return strings.get(Global.language, {}).get(key, key)

func translate_all(node: Node):
	for child in node.get_children():
		if child is Label or child is Button or child is RichTextLabel:
			var key = child.get_meta("key", "")
			
			if key == "":
				key = child.text
				child.set_meta("key", key)
			
			if strings[Global.language].has(key):
				var value = strings[Global.language][key]
				if value is String:
					child.text = value
			
			if child is Button:
				var btn_label = child.get_node_or_null("ButtonLabel")
				if btn_label != null:
					var lbl_key = btn_label.get_meta("key", "")
					if lbl_key == "":
						lbl_key = btn_label.text
						btn_label.set_meta("key", lbl_key)
					if strings[Global.language].has(lbl_key):
						var lbl_value = strings[Global.language][lbl_key]
						if lbl_value is String:
							btn_label.text = lbl_value
		
		if child is OptionButton:
			for i in range(child.get_item_count()):
				var item_text = child.get_item_text(i)
				var key = child.get_item_metadata(i)
				if key == null:
					key = item_text
					child.set_item_metadata(i, key)
				if strings[Global.language].has(key):
					var value = strings[Global.language][key]
					if value is String:
						child.set_item_text(i, value)
		
		translate_all(child)

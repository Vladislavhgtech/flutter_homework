import 'package:flutter/material.dart';

class SliverWidgets extends StatefulWidget {
  const SliverWidgets({Key? key}) : super(key: key);

  @override
  State<SliverWidgets> createState() => _SliverWidgetsState();
}

class _SliverWidgetsState extends State<SliverWidgets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('Гвианские тепуи'),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://picsum.photos/300/200',
                        fit: BoxFit.fill,
                      ),
                      Container(
                        color: Colors.black.withAlpha(127),
                      ),
                    ],
                  )),
            ),
            const SliverToBoxAdapter(
              child: Text('''
                  Тепуи, или тепуй, — столовые горыBiogeography of the Lost World (Pantepui region, northeastern South America): Insights from bryophytes / Phytotaxa, большая часть которых находится в венесуэльском национальном парке Канайма. Слово это на языке индейцев племени пемон означает «дом богов».
                  
                  Эти горы стоят над джунглями изолированно друг от друга, и на каждой из них обитают уникальные эндемичные виды животных и растений. 200 миллионов лет назад тепуи составляли единое плато, но позже тектонические процессы раскололи их на отдельные части. Открыл их немецкий исследователь Роберт Шомбургк в 1835 году.
                  Именно отчёты об экспедиции Роберта Шомбургка вдохновили Артура Конан Дойля на его роман «Затерянный мир» — о плато, населённом динозаврами.
    
                  Правда, на настоящих тепуи динозавров вроде не зафиксировано. Зато на этих высоких плато, густо покрытых лесами, произрастают многие тысячи видов орхидей, бромелий и самых разных насекомоядных растений, до сих пор не описанных наукой.
    
                  Природа каждой отдельной тепуи уникальна. НапримерInside the lost cave world of the Amazon’s tepui mountains / New Scientist, одна из гор, Рорайма-тепуи, — единственное известное место обитания кустарниковой жабы Рорайма. У этого маленького земноводного странный механизм защиты: перед лицом опасности оно сворачивается в клубок и укатывается прочь.
    
                  Рельеф тепуи делает подъёмBBC Two announces epic adventure series with Steve Backshall / BBC Media Centre на них чрезвычайно трудным занятием. Кроме того, в джунглях Гвианы выпадаетA journey into the world’s oldest and most puzzling caves / TED в среднем 4 000 миллиметров осадков в год. Из-за такой погоды шанс добраться до вершин тепуи бывает очень редко.'''),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  final CarouselController _carouselController = CarouselController();

  void _launchURL() async {
    const url = 'https://www.example.com'; // Replace with your desired URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openURLColetor() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.leonardocamposdonor.recicle';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      /// Não è possível abrir a URL
    }
  }

  void openURLDonor() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.coletor.recicle';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      /// Não è possível abrir a URL
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'https://www.recicle.app.br/img/video.mp4',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF198754),
        elevation: 0,
        title: SingleChildScrollView(
          child: Row(
            children: [
              Text(
                'Recicle++',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 40),
              const Text('Home'),
              const SizedBox(width: 10),
              const Text('Sobre'),
              const SizedBox(width: 10),
              const Text('Equipe'),
              const SizedBox(width: 10),
              const Text('Parceiros'),
              const SizedBox(width: 10),
              const Text('Vídeo'),
              const SizedBox(width: 10),
              const Text('GitHub'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              color: const Color(0xFF198754),
              child: Center(
                child: Container(
                  width: 1600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 500,
                          height: 600,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF198754),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recicle++ : App de Otimização de Rotas',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Deixe sua marca ajudando sua comunidade e o planeta.',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: openURLColetor,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                ),
                                child: Text(
                                  'Baixar App',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 330),
                      Center(
                        child: Container(
                          width: 700,
                          height: 1100,
                          color: Colors.transparent,
                          child: Image.asset('images/desingNovo.png'),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Container(
                width: 1000,
                child: Row(
                  children: [
                    Container(
                      width: 500,
                      height: 1000,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: [
                              'images/inicio1.jpeg',
                              'images/inicio2.jpeg',
                              'images/mapa.jpeg',
                              // Adicione mais imagens aqui
                            ].map((imagePath) {
                              return Container(
                                width: 400,
                                height: 800,
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              height: 800,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 100),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rede de Softwares',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 80),
                          Container(
                            width: 500,
                            child: Text(
                              "O Recicle++ é um aplicativo Open Source que busca soluções para facilitar e incrementar a coleta seletiva, minimizando os impactos ao meio ambiente e aumentando a quantidade de lixo reciclado. Além disso, visa reduzir os custos operacionais dos catadores ao desenvolver soluções otimizadas relativas às rotas com facilidades de contato entre catadores, cooperativas e doadores. A inclusão das rotas otimizadas no aplicativo, considerando múltiplos pontos (diversos doadores na rota de um coletor), possibilitará ao coletor a redução de custos por determinar percursos melhores e a redução de tempo, possibilitando coletar, dentro de um dia, mais material, dentre outros.",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Card(
              elevation: 5, // You can adjust the elevation as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: 900,
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 62, 175, 122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SizedBox(
                    width: 700,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Repositórios',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Os interessados podem ver a documentação do projeto através destes repositórios no Github.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _launchURL,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                'Doador',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                              onPressed: _launchURL,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                'Coletor',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                              onPressed: _launchURL,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                'Administrador',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Container(
                width: 1500,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sobre o Projeto',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 80),
                          Container(
                            width: 800,
                            child: Text(
                              "O Recicle++ é composto por três aplicativos: um para realizar a solicitação de coleta (Recicle++ Doador); um para realizar a coleta (Recicle++ Coletor); e um para administração e gerenciamento de prefeituras, cooperativas, ONGs e Catadores (Recicle++ Web). O Recicle++ é uma evolução significativa em relação ao seu antecessor, o Recicle+, desenvolvido pelo CEFET/MG. Esta versão aprimorada apresenta funcionalidades inovadoras, com destaque para a integração de rotas otimizadas, marcando um avanço significativo na eficiência da coleta de lixo reciclável. A incorporação de rotas com múltiplos pontos permite ao coletor realizar percursos que abrangem diversos doadores, proporcionando a oportunidade de otimizar suas trajetórias de maneira inteligente. Ao permitir que os doadores escolham os momentos mais convenientes para a entrega de seus materiais nos pontos designados, o Recicle++ facilita a comunicação direta entre eles e os catadores, por meio de um chat dedicado. Essa abordagem interativa cria um ambiente mais colaborativo e eficaz, permitindo que ambos os grupos se coordenem de maneira eficiente. Além disso, a funcionalidade de gerenciamento presente no Recicle++ é de grande valia para os gestores envolvidos. Eles podem cadastrar os catadores de forma centralizada e monitorar de perto o desempenho de suas atividades. Isso contribui para um controle mais efetivo, garantindo que as operações de coleta ocorram de maneira coordenada e eficiente. No desenvolvimento usamos React Native para Android, React JS para a versão web e o Firebase da Google como banco de dados, proporcionando soluções específicas e opções gratuitas.",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 100),
                    Container(
                      width: 500,
                      height: 1000,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: [
                              'images/inicio1.jpeg',
                              'images/inicio2.jpeg',
                              'images/mapa.jpeg',
                              // Adicione mais imagens aqui
                            ].map((imagePath) {
                              return Container(
                                width: 400,
                                height: 800,
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              height: 800,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 400,
              color: Color.fromARGB(255, 62, 175, 122),
              child: Center(
                child: SizedBox(
                  width: 1300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Parceiros',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/ICMC.png',
                              width: 250, height: 250),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('images/usp.png',
                              width: 250, height: 250),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('images/Logo_CEFET-MG.png',
                              width: 250, height: 250),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('images/cepid.png',
                              width: 250, height: 250),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            const Text("Vídeo de Apresentação"),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * (9 / 16) * 0.8,
              color: Colors.white,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF198754),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Recicle++',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Seu Slogan Aqui',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'contato@recicleapp.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '(123) 456-7890',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Copyright © 2023 Recicle++. Todos os direitos reservados.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

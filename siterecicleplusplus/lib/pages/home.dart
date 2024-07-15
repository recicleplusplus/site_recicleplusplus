import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TeamMember extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const TeamMember({required this.name, required this.role, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageUrl),
            ),
            SizedBox(height: 10),
            Text(
              role,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
            ),
            Text(
              name,
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  final CarouselController _carouselController = CarouselController();

  void _Coletor() async {
    const url = 'https://github.com/recicleplusplus/Coletor';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _Doador() async {
    const url = 'https://github.com/recicleplusplus/Donor';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _Adm() async {
    const url = 'https://github.com/recicleplusplus/manager';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _DockerCliente() async {
    const url = 'https://github.com/recicleplusplus/recicleplus_docker_client';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openURLColetor() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.recicleplusplus.Collector';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      /// Não è possível abrir a URL
    }
  }

  void openURLDonor() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.recicleplusplus.recicle&pli=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      /// Não è possível abrir a URL
    }
  }

  void openURLManager() async {
    const url =
        'https://reciclaplusnew.firebaseapp.com';
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
    var largura = MediaQuery.of(context).size.width; //toda largura do dispositivo
    var altura =  MediaQuery.of(context).size.height; //todo comprimento do dispositivo
    double alturaContainer = 0.0;
    if (altura >= 1024) {
      alturaContainer = altura * 0.70; // 70% da altura da tela
    } 
    else if (altura >= 768) {
      alturaContainer = altura * 0.80; // 80% da altura da tela
    } 
    else {
      alturaContainer = altura * 0.90; // 90% da altura da tela
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF198754),
        elevation: 0,
        title: const SingleChildScrollView(
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: alturaContainer,
              color: const Color(0xFF198754),
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: largura < 600 ? largura * 0.9 : largura * 0.4,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF198754),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              largura < 600 ? 
                              const Text(
                                'Recicle++ : App de Otimização de Rotas',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ):  const Text(
                                'Recicle++ : App de Otimização de Rotas',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Deixe sua marca ajudando sua comunidade e o planeta.',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 20),
                              largura < 600 ? 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start, // This will evenly space the buttons
                              children: [
                                ElevatedButton(
                                  onPressed: openURLColetor,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Baixar Coletor',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: openURLDonor,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Baixar Doador',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: openURLManager,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Acessar Manager',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ):
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center, // This will evenly space the buttons
                              children: [
                                ElevatedButton(
                                  onPressed: openURLColetor,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Baixar Coletor',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: openURLDonor,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Baixar Doador',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: openURLManager,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Acessar Manager',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )

                            ],
                          ),
                        ),
                      ),
                      largura < 600 ? Container() : SizedBox(width: 330),
                      largura < 600 ? Container() : 
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
                child: largura < 600 ?  Column(
                  children: [
                    Container(
                      width: 500,
                      height: 1000,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: [
                              'images/imagem1.jpg',
                              'images/imagem2.jpg',
                              'images/mapa.jpeg',
                              'images/imagem3.jpg',
                              'images/imagem4.jpg',
                              'images/imagem5.jpg',
                              'images/imagem6.jpg',
                              'images/imagem7.jpg',
                              'images/imagem8.jpg',
                              'images/imagem9.jpg'
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
                    const SizedBox(height: 50),
                      Column(
                        children: [
                          const Text(
                            'Rede de Softwares',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 50),
                          largura < 600 ?
                          Container(
                            width: largura < 600 ? largura * 0.8 : 500,
                            child: Text(
                              "O Recicle++ é um aplicativo Open Source que busca soluções para facilitar e incrementar a coleta seletiva, minimizando os impactos ao meio ambiente e aumentando a quantidade de lixo reciclado. Além disso, visa reduzir os custos operacionais dos catadores ao desenvolver soluções otimizadas relativas às rotas com facilidades de contato entre catadores, cooperativas e doadores. A inclusão das rotas otimizadas no aplicativo, considerando múltiplos pontos (diversos doadores na rota de um coletor), possibilitará ao coletor a redução de custos por determinar percursos melhores e a redução de tempo, possibilitando coletar, dentro de um dia, mais material, dentre outros.",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ) : Container(
                            width: largura < 600 ? largura * 0.9 : 500,
                            child: Text(
                              "O Recicle++ é um aplicativo Open Source que busca soluções para facilitar e incrementar a coleta seletiva, minimizando os impactos ao meio ambiente e aumentando a quantidade de lixo reciclado. Além disso, visa reduzir os custos operacionais dos catadores ao desenvolver soluções otimizadas relativas às rotas com facilidades de contato entre catadores, cooperativas e doadores. A inclusão das rotas otimizadas no aplicativo, considerando múltiplos pontos (diversos doadores na rota de um coletor), possibilitará ao coletor a redução de custos por determinar percursos melhores e a redução de tempo, possibilitando coletar, dentro de um dia, mais material, dentre outros.",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ) ,
                        ],
                      ),
                  ],
                ) :  Row(
                  children: [
                    Container(
                      width: 500,
                      height: 1000,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: [
                              'images/imagem1.jpg',
                              'images/imagem2.jpg',
                              'images/mapa.jpeg',
                              'images/imagem3.jpg',
                              'images/imagem4.jpg',
                              'images/imagem5.jpg',
                              'images/imagem6.jpg',
                              'images/imagem7.jpg',
                              'images/imagem8.jpg',
                              'images/imagem9.jpg'
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
                    const SizedBox(width: 100),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
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
            const SizedBox(height: 50),
            Center(
              child: Container(
                width: largura < 600 ? largura * 0.8 : 800,
                child: Row(
                  children: [
                      Column(
                        children: [
                          const Text(
                            'Sobre o Projeto',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 50),
                          largura < 600 ? 
                          Container(
                            width: largura < 600 ? largura * 0.8 : 800,
                            child: Text(
                              "O Recicle++ é composto por três aplicativos: um para realizar a solicitação de coleta (Recicle++ Doador); um para realizar a coleta (Recicle++ Coletor); e um para administração e gerenciamento de prefeituras, cooperativas, ONGs e Catadores (Recicle++ Web). O Recicle++ é uma evolução significativa em relação ao seu antecessor, o Recicle+, desenvolvido pelo CEFET/MG. Esta versão aprimorada apresenta funcionalidades inovadoras, com destaque para a integração de rotas otimizadas, marcando um avanço significativo na eficiência da coleta de lixo reciclável. A incorporação de rotas com múltiplos pontos permite ao coletor realizar percursos que abrangem diversos doadores, proporcionando a oportunidade de otimizar suas trajetórias de maneira inteligente. Ao permitir que os doadores escolham os momentos mais convenientes para a entrega de seus materiais nos pontos designados, o Recicle++ facilita a comunicação direta entre eles e os catadores, por meio de um chat dedicado. Essa abordagem interativa cria um ambiente mais colaborativo e eficaz, permitindo que ambos os grupos se coordenem de maneira eficiente. Além disso, a funcionalidade de gerenciamento presente no Recicle++ é de grande valia para os gestores envolvidos. Eles podem cadastrar os catadores de forma centralizada e monitorar de perto o desempenho de suas atividades. Isso contribui para um controle mais efetivo, garantindo que as operações de coleta ocorram de maneira coordenada e eficiente. No desenvolvimento usamos React Native para Android, React JS para a versão web e o Firebase da Google como banco de dados, proporcionando soluções específicas e opções gratuitas.",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ) : Container(
                            width: largura < 600 ? largura * 0.8 : 800,
                            child: Text(
                              "O Recicle++ é composto por três aplicativos: um para realizar a solicitação de coleta (Recicle++ Doador); um para realizar a coleta (Recicle++ Coletor); e um para administração e gerenciamento de prefeituras, cooperativas, ONGs e Catadores (Recicle++ Web). O Recicle++ é uma evolução significativa em relação ao seu antecessor, o Recicle+, desenvolvido pelo CEFET/MG. Esta versão aprimorada apresenta funcionalidades inovadoras, com destaque para a integração de rotas otimizadas, marcando um avanço significativo na eficiência da coleta de lixo reciclável. A incorporação de rotas com múltiplos pontos permite ao coletor realizar percursos que abrangem diversos doadores, proporcionando a oportunidade de otimizar suas trajetórias de maneira inteligente. Ao permitir que os doadores escolham os momentos mais convenientes para a entrega de seus materiais nos pontos designados, o Recicle++ facilita a comunicação direta entre eles e os catadores, por meio de um chat dedicado. Essa abordagem interativa cria um ambiente mais colaborativo e eficaz, permitindo que ambos os grupos se coordenem de maneira eficiente. Além disso, a funcionalidade de gerenciamento presente no Recicle++ é de grande valia para os gestores envolvidos. Eles podem cadastrar os catadores de forma centralizada e monitorar de perto o desempenho de suas atividades. Isso contribui para um controle mais efetivo, garantindo que as operações de coleta ocorram de maneira coordenada e eficiente. No desenvolvimento usamos React Native para Android, React JS para a versão web e o Firebase da Google como banco de dados, proporcionando soluções específicas e opções gratuitas.",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 70),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: largura < 600 ? largura: 900,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 62, 175, 122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SizedBox(
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
                            letterSpacing: 0.7,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Os interessados podem ver a documentação do projeto através destes repositórios no Github.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 0.7,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        largura < 600 ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _Doador,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
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
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: _Coletor,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
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
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: _Adm,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
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
                        ) : Center(
                          child: Container(
                            width: 600,
                            child: 
                          Row(
                          children: [
                            ElevatedButton(
                              onPressed: _Doador,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
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
                              onPressed: _Coletor,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
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
                              onPressed: _Adm,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
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
                        ))),
                         const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Os interessados em fazer alterações na aplicação para fins diversos, baixar o docker fornecido nesse link do github. O tutorial de instalação se encontra no readme.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 0.8,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _DockerCliente,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                ),
                              ),
                              child: Text(
                                'Docker',
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
            const SizedBox(height: 50),
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
            const SizedBox(height: 50),
            Container(
              width: largura < 600 ? largura * 1.2 : largura,
              color: Color(0xFF65AB78), // Background color
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                 const Text(
                    'Equipe',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'A equipe do Recicle++ é composta por integrantes do Cefet-MG e da USP, sendo eles dois professores e quatro alunos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Center(
                  child: 
                  Container(
                    width: 420,
                    child: 
                    const Column(
                      children: [
                        Row(
                        children: [
                          TeamMember(
                            name: 'Alisson Marques',
                            role: 'Orientador',
                            imageUrl: 'images/Alisson.jpg',
                          ),
                          TeamMember(
                            name: 'Maristela Oliveira',
                            role: 'Orientadora',
                            imageUrl: 'images/Maristela.jpeg',
                          ),
                          TeamMember(
                            name: 'Beatriz Lomes',
                            role: 'Desenvolvedora',
                            imageUrl: 'images/bia.jpeg',
                          )
                        ],
                      ), 
                       Row(
                        children: [
                          TeamMember(
                            name: 'Leonardo Campos',
                            role: 'Desenvolvedor',
                            imageUrl: 'images/leo.jpg',
                          ),
                          TeamMember(
                            name: 'Gabriel Souza',
                            role: 'Desenvolvedor',
                            imageUrl: 'images/gabriel.jpg',
                          ),
                          TeamMember(
                            name: 'Patrick Menezes',
                            role: 'Desenvolvedor',
                            imageUrl: 'images/patrick.jpg',
                          )
                        ],),
                      
                      ],
                    ),
                  ),
                  
                  ),
                
                  SizedBox(height: 30),
                  Container(
                    width: 600,
                    child: 
                    const Text(
                        'O projeto Recicle++ é uma ação conjunta do CEFET-MG Campus Divinópolis com o ICMC/USP. O Recicle++ consiste em três aplicativos: um para solicitar a coleta (Recicle++ Doador), um para realizar a coleta (Recicle++ Coletor) e um para administração e gerenciamento (Recicle++ Web).',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  
                ],
              ),
            ),
            
            const SizedBox(height: 50),
             Container(
              width: largura < 600 ? largura * 1.2 : largura,
              color: const Color.fromARGB(255, 62, 175, 122),
              child: Center(
                child: SizedBox(
                  width: largura < 600 ? largura : 1300,
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
                              width: largura < 600 ? 50 : 250, height: 150),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('images/usp.png',
                              width: largura < 600 ? 50 : 250, height: 150),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('images/Logo_CEFET-MG.png',
                              width: largura < 600 ? 50 : 250, height: 150),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('images/cepid.png',
                              width: largura < 600 ? 50 : 250, height: 150),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF198754),
              child: const Column(
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
                        'recicleplus.usp@gmail.com',
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
                    textAlign: TextAlign.center,
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

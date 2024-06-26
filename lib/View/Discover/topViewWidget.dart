import 'package:flutter/material.dart';
import 'package:voyage_mada_app/Controller/ContenuController.dart';
import 'package:voyage_mada_app/Model/contenuModel.dart';
import 'package:voyage_mada_app/View/constante.dart';

class TopDestinationViewWidget extends StatelessWidget {
  TopDestinationViewWidget({super.key});
  //creation d'instance de controller
  final ContenuController _controller = ContenuController();
  @override
  Widget build(BuildContext context) {
    //acces a la cantenue de constructeur
    List<ContenuModel> contenus = _controller.getTopDestination();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: contenus.length,
      itemBuilder: (context, index) {
        ContenuModel contenu = contenus[index]; //parcours du liste

        Container imageTopDestination = Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage(contenu.nomImage), //nom venant de homeController
              )),
        );

        Expanded nomTopDestination = Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitreH3(titre: contenu.nomDestination),
                Text(contenu.nomEndroit), //nom venant de homeController
              ],
            ),
          ),
        );
        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.20,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              //affichage 
              children: [imageTopDestination, nomTopDestination],
            ),
          ),
        );
      },
    );
  }
}

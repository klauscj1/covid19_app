import 'package:flutter/material.dart';

class ErrorDataWidget extends StatelessWidget {
  final VoidCallback aceptar;
  ErrorDataWidget({@required this.aceptar});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'No se ha logrado obtener los datos del servidor',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Reintentar',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white),
                ),
              ),
              onPressed: aceptar,
            ),
          )
        ],
      ),
    );
  }
}

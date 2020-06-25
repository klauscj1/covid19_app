import 'package:covid19_app/models/country_model.dart';
import 'package:flutter/material.dart';

class InformationDialog extends StatelessWidget {
  final Country country;

  InformationDialog({
    @required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final espacioVertical = size.height / 100.0;
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: espacioVertical * 6 + espacioVertical * 2,
            bottom: espacioVertical * 2,
            left: espacioVertical * 2,
            right: espacioVertical * 2,
          ),
          margin: EdgeInsets.only(top: espacioVertical * 6),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(espacioVertical * 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    country.country,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Total confirmados: ${country.totalConfirmed}'),
                  Text('Total muertes: ${country.totalDeaths}'),
                  Text('Total recuperados: ${country.totalRecovered}'),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Aceptar'),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: espacioVertical * 2,
          right: espacioVertical * 2,
          child: CircleAvatar(
            backgroundColor: Colors.blue[500],
            radius: espacioVertical * 5,
            child: Icon(
              Icons.info,
              size: espacioVertical * 6,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

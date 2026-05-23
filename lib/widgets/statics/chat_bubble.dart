import 'package:flutter/material.dart';
import 'package:v_wallet_frontend/helpers/consts.dart';

class ChatBubble extends StatefulWidget {
  final bool isUser;
  const ChatBubble({super.key, required this.isUser});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: widget.isUser
            ? userBubleBackgroundColor
            : reciverBubleBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: bubleBorderColor),
      ),
      child: Text(
        'Dolor duis eu consectetur commodo quis reprehenderit cupidatat sit non aliqua. Duis voluptate veniam consequat laborum consectetur aliqua esse nisi enim adipisicing qui laborum. Officia est eu excepteur id do laborum. Est incididunt adipisicing nisi nisi labore irure magna ut esse ipsum cillum. Sunt est in ullamco pariatur voluptate excepteur consectetur dolore elit et. \n Tempor elit fugiat deserunt est laboris commodo amet esse consequat dolore duis voluptate.  \n Exercitation nisi eiusmod enim qui nulla labore occaecat cillum sunt Lorem exercitation duis.Consequat aliqua sint proident proident fugiat sint ipsum commodo. Aliqua Lorem eiusmod eiusmod minim enim exercitation aliquip quis. Aliquip tempor laborum velit et laborum dolore magna commodo. Velit culpa dolore occaecat sit sit velit fugiat dolor nulla. \n Incididunt officia tempor ipsum do reprehenderit tempor do ea laborum. Aute est qui ea aute qui esse aliqua eiusmod Lorem sit velit consequat tempor consequat. Do in elit nulla enim qui velit mollit consequat. Do minim laboris deserunt anim id consectetur ullamco Lorem ut. \n Fugiat pariatur ut pariatur ea minim aute est in cillum reprehenderit voluptate elit fugiat. \n Laborum voluptate fugiat in qui aliquip nisi commodo sunt dolor irure. Nostrud mollit ut laboris sit Lorem ut officia sint veniam quis.Anim elit exercitation qui esse nostrud consectetur. \n Enim et elit tempor officia eiusmod ex in cillum aute. Culpa ex aliqua nostrud fugiat id deserunt deserunt. Elit minim ut magna commodo aute mollit. Aute sint nostrud dolore dolore fugiat ipsum cupidatat laboris tempor. Nulla id est tempor qui reprehenderit commodo do ut in ipsum incididunt et sint qui. Nulla eiusmod est in incididunt laboris eu voluptate commodo adipisicing ad Lorem incididunt. Laborum nisi elit id nulla sunt nisi anim irure consectetur do eu nulla. Lorem elit fugiat amet ut enim cupidatat labore ad culpa sit eiusmod laborum anim. Minim elit voluptate id et aute consequat veniam culpa fugiat occaecat nulla aute aliqua. Ea aliquip excepteur labore excepteur culpa. \n Amet excepteur duis voluptate minim velit veniam magna velit aliqua. Aute fugiat excepteur officia et proident. Qui ipsum anim ad labore consectetur et tempor reprehenderit. Cupidatat consectetur veniam dolore id consectetur. Ea fugiat exercitation cillum aute. \n Minim ullamco occaecat commodo dolore eiusmod Lorem excepteur ea Lorem reprehenderit. Dolor aute est cupidatat commodo ipsum amet nostrud occaecat ullamco incididunt ullamco quis qui. Eiusmod eiusmod duis esse laboris esse excepteur.',
        style: TextStyle(
          color: widget.isUser ? userBubleTextColor : reciverBubleTextColor,
        ),
      ),
    );
  }
}

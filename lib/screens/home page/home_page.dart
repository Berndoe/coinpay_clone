import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        leading: const Icon(
          FontAwesome.trophy_solid,
          color: Colors.white,
        ),
        title: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            iconColor: Colors.white,
            hintText: 'Search "Payments" ',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            prefixIcon: Icon(Bootstrap.search),
          ),
        ),
        actions: [const Icon(Icons.notifications)],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(child: Flag(Flags.united_states_of_america)),
            const Text('US Dollar'),
            const Icon(Icons.arrow_drop_down),
            const Text(
              '\$20,000',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'Available Balance',
              style: TextStyle(color: Colors.grey),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStateColor.transparent),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                  ),
                  Text('Add Money'),
                ],
              ),
            ),
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.blue,
                      ),
                      VerticalDivider(
                        width: 2,
                      ),
                      Icon(
                        Icons.monetization_on,
                        color: Colors.orange,
                      ),
                      VerticalDivider(width: 2),
                      Icon(
                        Bootstrap.bank,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Send'),
                      Text('Request'),
                      Text('Bank'),
                    ],
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Transaction',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Icon(Icons.arrow_forward)],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.wallet),
                      ),
                      Text('Spending'),
                      Column(
                        children: [Text('-\$500'), Icon(Icons.arrow_forward)],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.wallet),
                      ),
                      Text('Income'),
                      Column(
                        children: [Text('\$3000'), Icon(Icons.arrow_forward)],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.wallet),
                      ),
                      Text('Bills'),
                      Column(
                        children: [Text('-\$800'), Icon(Icons.arrow_forward)],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.wallet),
                      ),
                      Text('Savings'),
                      Column(
                        children: [Text('\$1000'), Icon(Icons.arrow_forward)],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Bootstrap.house),
            const Icon(Bootstrap.pie_chart),
            Container(
              color: Colors.blue.shade900,
              child: const Icon(FontAwesome.camera_solid),
            ),
            const Icon(FontAwesome.message_solid),
            const Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}

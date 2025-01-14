import PetriKit

// The following declares the Petri net depicted on the slide n°18 of your lecture notes on Petri
// net properties (i.e. "RdPPresProp.pdf").

// Declare the set of places.
enum Place: CaseIterable { //CaseIterable = protocole
  case p1, p2, p3
}

// Declare the structure of the Petri net.
let a = PTTransition<Place>( //Réseau Place-Transition
  named         : "a",
  preconditions : [PTArc(place: .p1, label: 1)], //Préscondition = PTArc => Arcs entrants, Label = jeton
  postconditions: [PTArc(place: .p2, label: 1)])
let b = PTTransition<Place>(
  named         : "b",
  preconditions : [PTArc(place: .p3, label: 1)],
  postconditions: [PTArc(place: .p2, label: 1)])
let c = PTTransition<Place>(
  named         : "c",
  preconditions : [PTArc(place: .p2, label: 1)],
  postconditions: [PTArc(place: .p3, label: 1)])
  let c = PTTransition<Place>(
    named         : "d",
    preconditions : [PTArc(place: .p1, label: 1)],
  postconditions: [])
let pn = PTNet(transitions: [a, b, c, d]) //Place -transition -net

// do {
//
//   let m0: Marking<Place, UInt> = [.p1: 3, .p2: 0, .p3: 0] //Sorte de dictionnaire , valeur du dico = UInt (UnsignedInteger = Natural Numbers)
// //. = une énumération veut dire "Place.p1"
//   if let states = computeGraph(of: pn, from: m0) {
//     print("There are \(Array(states).count) states")
//
//     //let nonEmptyP2AndP3 = states.filter { state in //EXAM: qu'est-ce qu'un prédicat ? Comme un testeur, Fonction dont le co-domaine est un booléen.
//       //state.marking[.p2] == 0 && state.marking[.p3] == 0 && state.marking[.p1] == 0
//       let hasBlockingState = states.contains { state in
//         for transition in pn.transitions {
//           if !transition.isFireable(from: state.marking) {
//             return false
//         }
//         }
//         return true
//       }
//       //a.isFireable(from: state.marking)
//   //  }
//       print(hasBlockingState)
//   //  for state in nonEmptyP2AndP3 {
//   //      print(state.marking)
// //  }
//     }
//    }
//Solution 1: mettre 0 partout // Solution 3: Rajouter un transition D qui consomme un jeton de p1 sans postcondition=> ne produit aucun jeton ne fait que consommer.
do {

  let m0: Marking<Place, UInt> = [.p1: 0, .p2: 0, .p3: 0] //Sorte de dictionnaire , valeur du dico = UInt (UnsignedInteger = Natural Numbers)
//. = une énumération veut dire "Place.p1"
  if let states = computeGraph(of: pn, from: m0) {
    print("There are \(Array(states).count) states")

    //let nonEmptyP2AndP3 = states.filter { state in //EXAM: qu'est-ce qu'un prédicat ? Comme un testeur, Fonction dont le co-domaine est un booléen.
      //state.marking[.p2] == 0 && state.marking[.p3] == 0 && state.marking[.p1] == 0
      let hasBlockingState = states.contains { state in
        for transition in pn.transitions {
          if !transition.isFireable(from: state.marking) {
            return false
        }
        }
        return true
      }
      //a.isFireable(from: state.marking)
  //  }
      print(hasBlockingState)
  //  for state in nonEmptyP2AndP3 {
  //      print(state.marking)
//  }
    }
   }



// Declare the initial marking.
//do {

  //let m0: Marking<Place, UInt> = [.p1: 10, .p2: 0, .p3: 0] //Sorte de dictionnaire , valeur du dico = UInt (UnsignedInteger = Natural Numbers)
//. = une énumération veut dire "Place.p1"
  //if let states = computeGraph(of: pn, from: m0) {
  //print("There are \(Array(states).count) states")
//}
//}

// Fire the transition `a` from the initial marking.
//guard let m1 = a.fire(from: m0) else {
//  fatalError("'a' was not fireable from \(m0)")
//}

// Build the state space of the petri net. Sorte d'ensemble de tous les marquages atteignables.
//if let states = computeGraph(of: pn, from: m0) { //retourne en optionnel. On ne peut pas retourner un réseau non borné, donc si trouve un réseau non borné  = computeGraph retournera "nil".
  // Print all the reachable states.
//  print("The following markings are accessible:")
//  for state in states {
//    print(state.marking)
//  }
//  print()

  // Now that we collected all states, we can search for those that match a particular criterion.
//  let haveOneTokenInP2 = states.filter { state in state.marking[.p2] == 1 } //Chercher dans toutes les places atteignables, qui ont un jeton.
//  print("The following markings have 1 token in 'p2':")
//  for state in haveOneTokenInP2 {
//    print(state.marking)
//  }
//  print()
//} else {
//  print("The petri net is unbounded")
//}

// Note that if the network is unbounded, then `computeGraph(of:from:)` returns nil. For instance,
// if we change the Petri net so that transition `a` puts a token back into `p1`, the model becomes
// unbounded.
//
//let a2 = PTTransition<Place>(
//  named         : "a2", //flèche de "a" à P1
//  preconditions : [PTArc(place: .p1, label: 1)],
//  postconditions: [PTArc(place: .p1, label: 1), PTArc(place: .p2, label: 1)])
//let pn2 = PTNet(transitions: [a2, b, c])
//if computeGraph(of: pn2, from: [.p1: 1, .p2: 0, .p3: 0]) == nil {
//  print("The petri net is unbounded")// "non borné"
//}

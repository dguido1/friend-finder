//
//  GreenToggle.swift
//  friend-finder
//
//  Created by David Guido on 12/8/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI

struct GreenToggle : UIViewRepresentable {
  func makeUIView(context: Context) -> UISwitch {
    UISwitch()
  }

  func updateUIView(_ uiView: UISwitch, context: Context) {
    uiView.onTintColor = UIColor.green
  }
}

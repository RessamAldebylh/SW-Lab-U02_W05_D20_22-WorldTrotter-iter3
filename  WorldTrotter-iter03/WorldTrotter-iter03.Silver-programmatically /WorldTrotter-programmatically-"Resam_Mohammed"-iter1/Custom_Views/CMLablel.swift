//
//  CMLablel.swift
//  WorldTrotter-programmatically-"Resam_Mohammed"-iter1
//
//  Created by Ressam Al-Thebailah on 26/03/1443 AH.
//

import UIKit
class CMLabel:UILabel {
  override init(frame: CGRect) {
    super.init(frame:frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
 
  init(text : String,
       textSize :CGFloat,
       textColor : UIColor = UIColor.black) {
    super.init(frame:.zero)
    self.text = text
    self.font = UIFont.systemFont(ofSize:textSize)
    self.textColor = textColor
    self.translatesAutoresizingMaskIntoConstraints = false
    
  }
}

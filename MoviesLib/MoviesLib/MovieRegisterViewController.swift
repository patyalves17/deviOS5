//
//  MovieRegisterViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/09/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class MovieRegisterViewController: UIViewController {

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var tfRating: UITextField!
    @IBOutlet weak var tfDuration: UITextField!
    @IBOutlet weak var tvSummary: UITextView!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var btAddUpdate: UIButton!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if movie != nil {
            tfTitle.text = movie.title
            tfRating.text = "\(movie.rating)"
            tfDuration.text = movie.duration
            tvSummary.text = movie.summary
            btAddUpdate.setTitle("Atualizar", for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if movie != nil {
            lbCategories.text = movie.categoriesLabel
//            if let categories = movie.categories {
//                let names = categories.map({($0 as! Category).name!})
//                let formattedCategories: String = names.joined(separator: " | ")
//                lbCategories.text = formattedCategories
//            }
        }
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CategoriesViewController
        if movie == nil {
            movie = Movie(context: context)
        }
        vc.movie = movie
    }
    
    
    @IBAction func addUpdateMovie(_ sender: UIButton) {
        if movie == nil {
            movie = Movie(context: context)
        }
        movie.title = tfTitle.text
        movie.rating = Double(tfRating.text!)!
        movie.summary = tvSummary.text
        movie.duration = tfDuration.text
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        close(nil)
    }
    
    @IBAction func close(_ sender: UIButton?) {
        
        if movie != nil && movie.title == nil {
            context.delete(movie)
        }
        
        
        
        
        dismiss(animated: true, completion: nil)
    }

}






























//
//  Category.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 12/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

enum Category: String, Codable {
    case generalKnowledge = "General Knowledge"
    case entertainmentBooks = "Entertainment: Books"
    case entertainmentFilm = "Entertainment: Film"
    case entertainmentMusic = "Entertainment: Music"
    case entertainmentMusicalsAndTheatres = "Entertainment: Musicals & Theatres"
    case entertainmentTelevision = "Entertainment: Television"
    case entertainmentVideoGames = "Entertainment: Video Games"
    case entertainmentBoardGames = "Entertainment: Board Games"
    case scienceAndNature = "Science & Nature"
    case scienceComputers = "Science: Computers"
    case scienceMathematics = "Science: Mathematics"
    case mythology = "Mythology"
    case sports = "Sports"
    case geography = "Geography"
    case history = "History"
    case politics = "Politics"
    case art = "Art"
    case celebrities = "Celebrities"
    case animals = "Animals"
    case vehicles = "Vehicles"
    case entertainmentComics = "Entertainment: Comics"
    case scienceGadgets = "Science: Gadgets"
    case entertainmentJapaneseAnimeAndManga = "Entertainment: Japanese Anime & Manga"
    case entertainmentCartoonAndAnimations = "Entertainment: Cartoon & Animations"
    
    func systemName() -> String {
        switch self {
        case .generalKnowledge: return "globe"
        case .entertainmentBooks:  return "book"
        case .entertainmentFilm:  return "film.fill"
        case .entertainmentMusic:  return "music.note"
        case .entertainmentMusicalsAndTheatres:  return "music.house"
        case .entertainmentTelevision:  return "tv"
        case .entertainmentVideoGames:  return "gamecontroller"
        case .entertainmentBoardGames:  return "square.grid.3x2"
        case .scienceAndNature:  return "flame"
        case .scienceComputers:  return "desktopcomputer"
        case .scienceMathematics:  return "x.squareroot"
        case .mythology:  return "lasso"
        case .sports:  return "sportscourt"
        case .geography:  return "map"
        case .history:  return "timer"
        case .politics:  return "person.3"
        case .art:  return "scribble"
        case .celebrities:  return "person"
        case .animals:  return "tortoise"
        case .vehicles:  return "car"
        case .entertainmentComics:  return "message.fill"
        case .scienceGadgets:  return "hammer"
        case .entertainmentJapaneseAnimeAndManga:  return "mappin.and.ellipse"
        case .entertainmentCartoonAndAnimations:  return "wand.and.stars"
        }
    }
}

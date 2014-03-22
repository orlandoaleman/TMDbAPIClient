//
//  TMDbConstants.m
//  Actors
//
//  Created by Orlando Aleman Ortiz on 19/10/13.
//  Copyright (c) 2013 Orlando Aleman Ortiz. All rights reserved.
//

#include "TMDbConstants.h"

NSString *const kTMDbBaseURLString = @"http://api.themoviedb.org/3/";
NSString *const kTMDbBasePublicURLString = @"http://www.themoviedb.org/";

#pragma mark - API Resources Path
NSString *const kTMDbConfigurationPath = @"configuration";
NSString *const kTMDbConfigurationImagesKey = @"images";
NSString *const kTMDbConfigurationImagesBaseUrlKey = @"base_url";
NSString *const kTMDbGenreListPath = @"genre/list";
NSString *const kTMDbGenreMoviesPath = @"genre/:id/movies";
NSString *const kTMDbMovieSearchPath = @"search/movie";
NSString *const kTMDbMoviePath = @"movie/:id";
NSString *const kTMDbMovieCastsPath = @"movie/:id/casts";
NSString *const kTMDbMovieImagesPath = @"movie/:id/images";
NSString *const kTMDbMovieTrailersPath = @"movie/:id/trailers";
NSString *const kTMDbMovieSimilarPath = @"movie/:id/similar_movies";
NSString *const kTMDbMovieUpcomingPath = @"movie/upcoming";
NSString *const kTMDbMovieTheatresPath = @"movie/now_playing";
NSString *const kTMDbMovieTopRatedPath = @"movie/top_rated";
NSString *const kTMDbPersonPath = @"person/:id";
NSString *const kTMDbPersonSearchPath = @"search/person";
NSString *const kTMDbPersonPopularPath = @"person/popular";
NSString *const kTMDbPersonNameKey = @"name";
NSString *const kTMDbPersonBiographyKey = @"biography";
NSString *const kTMDbPersonCreditsKey = @"credits";
NSString *const kTMDbPersonCreditsImagePathKey = @"poster_path";
NSString *const kTMDbPersonImagePathKey = @"profile_path";
NSString *const kTMDbPersonPlaceOfBirthKey = @"place_of_birth";
NSString *const kTMDbPersonBirthDayKey = @"birthday";
NSString *const kTMDbPersonDeathDayKey = @"deathday";
NSString *const kTMDbPersonCreditsCastKey = @"cast";
NSString *const kTMDbPersonCreditsCrewKey = @"crew";
NSString *const kTMDbPersonCreditsCastReleaseDateKey = @"release_date";
NSString *const kTMDbPersonCreditsCastTitleKey = @"original_title";
NSString *const kTMDbPersonTVCreditsKey = @"tv_credits";
NSString *const kTMDbPersonTVCreditsCastTitleKey = @"original_name";
NSString *const kTMDbSearchParamQueryKey = @"query";
NSString *const kTMDbSearchParamTypeKey = @"search_type";
NSString *const kTMDbSearchParamTypeNgram = @"ngram";
NSString *const kTMDbSearchParamTypePhrase = @"phrase";
NSString *const kTMDbSearchResultsKey = @"results";
NSString *const kTMDbSearchResultsObjectIdKey = @"id";
NSString *const kTMDbObjectIdKey = @"id";

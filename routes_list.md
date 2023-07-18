// CREATE PROFILE

- Route::middleware('auth:sanctum')->post('/profile', [UserController::class, 'create_profile']);
- Route::middleware('auth:sanctum')->post('/edit-profile', [UserController::class, 'edit_profile']);
- Route::middleware('auth:sanctum')->post('/edit-profile-image', [UserController::class, 'edit_profile_image']);

// ADD LOCATION

- Route::middleware('auth:sanctum')->post('/location', [UserController::class, 'add_location']);
- Route::middleware('auth:sanctum')->delete('/users', [UserController::class, 'destroy']);

// ANIMAL ========================================

- Route::get('/animal/{id}', [AnimalController::class, 'show']);
- Route::get('/animals/create', [AnimalController::class, 'create']);
- Route::middleware('auth:sanctum')->post('/animals', [AnimalController::class, 'store']);
- Route::middleware('auth:sanctum')->post('/edit-animal-profile', [AnimalController::class, 'edit_animal_profile']);
- Route::middleware('auth:sanctum')->delete('/animal/{id}', [AnimalController::class, 'destroy']);

// RECOMMENDATIONS ========================================

- Route::get('/recommendations', [RecommendationController::class, 'index']);

// LIKES

- Route::middleware('auth:sanctum')->post('/likes', [LikeController::class, 'store']);
- Route::middleware('auth:sanctum')->post('/dislikes', [DislikeController::class, 'store']);

// NOTIFICATIONS

- Route::middleware('auth:sanctum')->get('/notifications', [NotificationController::class, 'index']);

// CHATS

- Route::middleware('auth:sanctum')->get('/chats', [ChatController::class, 'index']);
- Route::middleware('auth:sanctum')->get('/chat/{id}', [ChatController::class, 'show']);
- Route::middleware('auth:sanctum')->put('/chat/{id}', [ChatController::class, 'update']);
- Route::middleware('auth:sanctum')->get('/blocked-users', [ChatController::class, 'blocked_users']);

// MESSAGES

- Route::middleware('auth:sanctum')->post('/unread-messages-count', [MessageController::class, 'index']);
- Route::middleware('auth:sanctum')->post('/messages', [MessageController::class, 'store']);

// SUBSCRIPTION

- Route::middleware('auth:sanctum')->get('/subscription', [SubscriptionController::class, 'show']);

// QUOTA

- Route::middleware('auth:sanctum')->get('/quota', [QuotaController::class, 'show']);

// REPORT

- Route::post('/reports', [ReportController::class, 'store']);

// Tier

- Route::middleware('auth:sanctum')->get('/tiers', [TierController::class, 'index']);

// Transaction

- Route::middleware('auth:sanctum')->post('/transactions', [TransactionController::class, 'store']);
- Route::post('/paymob-transactions', [PaymobTransactionController::class, 'store']);

// Ad

- Route::middleware('auth:sanctum')->get('/ads', [AdController::class, 'index']);
- Route::middleware('auth:sanctum')->post('/ads', [AdController::class, 'update']);

// Currency

- Route::get('/dollar', function () {
  // $client = new \GuzzleHttp\Client();
  // $res = $client->request('GET', 'https://www.cbe.org.eg/ar/EconomicResearch/Statistics/Pages/ExchangeRatesListing.aspx');
  // $dom = HtmlDomParser::str_get_html( $res->getBody() );

      //   $word = '';
      //   $i = 0;
      //   forEach($dom->find('table.table tr td') as $td){
      //     if(str_starts_with($td->plaintext, 'دولار')){
      //       $word = $dom->find('table.table tr td')[$i +1]->plaintext;
      //     }
      //   }

      //   return [ 'dollarEquals' => $word ];
      return 30;

  });

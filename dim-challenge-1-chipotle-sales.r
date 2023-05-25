{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "679c0044",
   "metadata": {
    "_cell_guid": "0caa28dc-d009-41e8-8f06-442727da3498",
    "_uuid": "641a454e-69ca-4f02-acab-805e6c7206a0",
    "papermill": {
     "duration": 0.009028,
     "end_time": "2023-05-25T20:43:36.559356",
     "exception": false,
     "start_time": "2023-05-25T20:43:36.550328",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Scenario\n",
    "\n",
    "You are a financial data analyst at Chipotle and your manager has tasked you with analyzing the most recent sales numbers. She has provided the following set of questions she would like answered."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "89906a45",
   "metadata": {
    "_cell_guid": "a9d3a7e5-45d7-447a-8e68-7ec5db776d96",
    "_uuid": "320476ed-ce9c-4990-a21d-e5984b7d0429",
    "papermill": {
     "duration": 0.007757,
     "end_time": "2023-05-25T20:43:36.574985",
     "exception": false,
     "start_time": "2023-05-25T20:43:36.567228",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Load Packages"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "da18c67a",
   "metadata": {
    "_cell_guid": "21a0dc0a-616e-4d89-8a5f-b06ed2941eb9",
    "_uuid": "a3c2f9ae-1862-41e4-aaf9-c94fc335e5d3",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:36.595019Z",
     "iopub.status.busy": "2023-05-25T20:43:36.592760Z",
     "iopub.status.idle": "2023-05-25T20:43:37.907575Z",
     "shell.execute_reply": "2023-05-25T20:43:37.905585Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.328578,
     "end_time": "2023-05-25T20:43:37.911399",
     "exception": false,
     "start_time": "2023-05-25T20:43:36.582821",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(readr)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "70ec646c",
   "metadata": {
    "_cell_guid": "30d67841-e2b8-4d5f-b492-9629726f57b3",
    "_uuid": "968cb387-0ca3-41bc-9965-6092a7b4d2fb",
    "papermill": {
     "duration": 0.007959,
     "end_time": "2023-05-25T20:43:37.927657",
     "exception": false,
     "start_time": "2023-05-25T20:43:37.919698",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Load Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "ae28a332",
   "metadata": {
    "_cell_guid": "8f1366f5-0a31-4fde-9b3d-5c437e84ee6f",
    "_uuid": "0aab44df-21b2-4691-8301-733329868ba6",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:37.985718Z",
     "iopub.status.busy": "2023-05-25T20:43:37.947311Z",
     "iopub.status.idle": "2023-05-25T20:43:38.417476Z",
     "shell.execute_reply": "2023-05-25T20:43:38.415460Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.485601,
     "end_time": "2023-05-25T20:43:38.421247",
     "exception": false,
     "start_time": "2023-05-25T20:43:37.935646",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "url <- 'https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv'\n",
    "chipotle_df <- read.csv(url, sep = '\\t')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "57726aa8",
   "metadata": {
    "_cell_guid": "4a64b05b-e127-4385-8100-b9d93067c577",
    "_uuid": "2171e5a5-984a-430e-92e9-eb76cd79e55d",
    "papermill": {
     "duration": 0.008207,
     "end_time": "2023-05-25T20:43:38.438137",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.429930",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## View Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "16c8433f",
   "metadata": {
    "_cell_guid": "470d531d-3632-487a-a43a-66637db116c4",
    "_uuid": "5f7b61f4-70e9-4377-9a6d-9a1cceafb9c3",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:38.458486Z",
     "iopub.status.busy": "2023-05-25T20:43:38.456767Z",
     "iopub.status.idle": "2023-05-25T20:43:38.566348Z",
     "shell.execute_reply": "2023-05-25T20:43:38.563138Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.124056,
     "end_time": "2023-05-25T20:43:38.570449",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.446393",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4622 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>order_id</th><th scope=col>quantity</th><th scope=col>item_name</th><th scope=col>choice_description</th><th scope=col>item_price</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td> 1</td><td>1</td><td>Chips and Fresh Tomato Salsa         </td><td>NULL                                                                                                                                     </td><td>$2.39  </td></tr>\n",
       "\t<tr><td> 1</td><td>1</td><td>Izze                                 </td><td>[Clementine]                                                                                                                             </td><td>$3.39  </td></tr>\n",
       "\t<tr><td> 1</td><td>1</td><td>Nantucket Nectar                     </td><td>[Apple]                                                                                                                                  </td><td>$3.39  </td></tr>\n",
       "\t<tr><td> 1</td><td>1</td><td>Chips and Tomatillo-Green Chili Salsa</td><td>NULL                                                                                                                                     </td><td>$2.39  </td></tr>\n",
       "\t<tr><td> 2</td><td>2</td><td>Chicken Bowl                         </td><td>[Tomatillo-Red Chili Salsa (Hot), [Black Beans, Rice, Cheese, Sour Cream]]                                                               </td><td>$16.98 </td></tr>\n",
       "\t<tr><td> 3</td><td>1</td><td>Chicken Bowl                         </td><td>[Fresh Tomato Salsa (Mild), [Rice, Cheese, Sour Cream, Guacamole, Lettuce]]                                                              </td><td>$10.98 </td></tr>\n",
       "\t<tr><td> 3</td><td>1</td><td>Side of Chips                        </td><td>NULL                                                                                                                                     </td><td>$1.69  </td></tr>\n",
       "\t<tr><td> 4</td><td>1</td><td>Steak Burrito                        </td><td>[Tomatillo Red Chili Salsa, [Fajita Vegetables, Black Beans, Pinto Beans, Cheese, Sour Cream, Guacamole, Lettuce]]                       </td><td>$11.75 </td></tr>\n",
       "\t<tr><td> 4</td><td>1</td><td>Steak Soft Tacos                     </td><td>[Tomatillo Green Chili Salsa, [Pinto Beans, Cheese, Sour Cream, Lettuce]]                                                                </td><td>$9.25  </td></tr>\n",
       "\t<tr><td> 5</td><td>1</td><td>Steak Burrito                        </td><td>[Fresh Tomato Salsa, [Rice, Black Beans, Pinto Beans, Cheese, Sour Cream, Lettuce]]                                                      </td><td>$9.25  </td></tr>\n",
       "\t<tr><td> 5</td><td>1</td><td>Chips and Guacamole                  </td><td>NULL                                                                                                                                     </td><td>$4.45  </td></tr>\n",
       "\t<tr><td> 6</td><td>1</td><td>Chicken Crispy Tacos                 </td><td>[Roasted Chili Corn Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream]]                                                   </td><td>$8.75  </td></tr>\n",
       "\t<tr><td> 6</td><td>1</td><td>Chicken Soft Tacos                   </td><td>[Roasted Chili Corn Salsa, [Rice, Black Beans, Cheese, Sour Cream]]                                                                      </td><td>$8.75  </td></tr>\n",
       "\t<tr><td> 7</td><td>1</td><td>Chicken Bowl                         </td><td>[Fresh Tomato Salsa, [Fajita Vegetables, Rice, Cheese, Sour Cream, Guacamole]]                                                           </td><td>$11.25 </td></tr>\n",
       "\t<tr><td> 7</td><td>1</td><td>Chips and Guacamole                  </td><td>NULL                                                                                                                                     </td><td>$4.45  </td></tr>\n",
       "\t<tr><td> 8</td><td>1</td><td>Chips and Tomatillo-Green Chili Salsa</td><td>NULL                                                                                                                                     </td><td>$2.39  </td></tr>\n",
       "\t<tr><td> 8</td><td>1</td><td>Chicken Burrito                      </td><td>[Tomatillo-Green Chili Salsa (Medium), [Pinto Beans, Cheese, Sour Cream]]                                                                </td><td>$8.49  </td></tr>\n",
       "\t<tr><td> 9</td><td>1</td><td>Chicken Burrito                      </td><td>[Fresh Tomato Salsa (Mild), [Black Beans, Rice, Cheese, Sour Cream, Lettuce]]                                                            </td><td>$8.49  </td></tr>\n",
       "\t<tr><td> 9</td><td>2</td><td>Canned Soda                          </td><td>[Sprite]                                                                                                                                 </td><td>$2.18  </td></tr>\n",
       "\t<tr><td>10</td><td>1</td><td>Chicken Bowl                         </td><td>[Tomatillo Red Chili Salsa, [Fajita Vegetables, Black Beans, Sour Cream, Cheese, Lettuce]]                                               </td><td>$8.75  </td></tr>\n",
       "\t<tr><td>10</td><td>1</td><td>Chips and Guacamole                  </td><td>NULL                                                                                                                                     </td><td>$4.45  </td></tr>\n",
       "\t<tr><td>11</td><td>1</td><td>Barbacoa Burrito                     </td><td>[[Fresh Tomato Salsa (Mild), Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot)], [Rice, Cheese, Sour Cream, Lettuce]]</td><td>$8.99  </td></tr>\n",
       "\t<tr><td>11</td><td>1</td><td>Nantucket Nectar                     </td><td>[Pomegranate Cherry]                                                                                                                     </td><td>$3.39  </td></tr>\n",
       "\t<tr><td>12</td><td>1</td><td>Chicken Burrito                      </td><td>[[Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot)], [Pinto Beans, Rice, Cheese, Sour Cream, Guacamole, Lettuce]]   </td><td>$10.98 </td></tr>\n",
       "\t<tr><td>12</td><td>1</td><td>Izze                                 </td><td>[Grapefruit]                                                                                                                             </td><td>$3.39  </td></tr>\n",
       "\t<tr><td>13</td><td>1</td><td>Chips and Fresh Tomato Salsa         </td><td>NULL                                                                                                                                     </td><td>$2.39  </td></tr>\n",
       "\t<tr><td>13</td><td>1</td><td>Chicken Bowl                         </td><td>[Roasted Chili Corn Salsa (Medium), [Pinto Beans, Rice, Fajita Veggies, Cheese, Sour Cream, Lettuce]]                                    </td><td>$8.49  </td></tr>\n",
       "\t<tr><td>14</td><td>1</td><td>Carnitas Burrito                     </td><td>[[Tomatillo-Green Chili Salsa (Medium), Roasted Chili Corn Salsa (Medium)], [Black Beans, Rice, Sour Cream, Lettuce]]                    </td><td>$8.99  </td></tr>\n",
       "\t<tr><td>14</td><td>1</td><td>Canned Soda                          </td><td>[Dr. Pepper]                                                                                                                             </td><td>$1.09  </td></tr>\n",
       "\t<tr><td>15</td><td>1</td><td>Chicken Burrito                      </td><td>[Tomatillo-Green Chili Salsa (Medium), [Pinto Beans, Rice, Cheese, Sour Cream]]                                                          </td><td>$8.49  </td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>1825</td><td>1</td><td>Barbacoa Burrito   </td><td>[Tomatillo Red Chili Salsa, [Rice, Fajita Vegetables, Black Beans, Sour Cream, Cheese, Guacamole]]</td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1825</td><td>1</td><td>Carnitas Bowl      </td><td>[Roasted Chili Corn Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                        </td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1825</td><td>1</td><td>Barbacoa Bowl      </td><td>[Roasted Chili Corn Salsa, [Pinto Beans, Sour Cream, Cheese, Lettuce, Guacamole]]                 </td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1826</td><td>1</td><td>Chicken Bowl       </td><td>[Tomatillo Green Chili Salsa, [Rice, Black Beans]]                                                </td><td>$8.75  </td></tr>\n",
       "\t<tr><td>1826</td><td>1</td><td>Chips and Guacamole</td><td>NULL                                                                                              </td><td>$4.45  </td></tr>\n",
       "\t<tr><td>1826</td><td>1</td><td>Canned Soft Drink  </td><td>[Nestea]                                                                                          </td><td>$1.25  </td></tr>\n",
       "\t<tr><td>1826</td><td>1</td><td>Bottled Water      </td><td>NULL                                                                                              </td><td>$1.50  </td></tr>\n",
       "\t<tr><td>1827</td><td>1</td><td>Chicken Bowl       </td><td>[Roasted Chili Corn Salsa, [Cheese, Lettuce]]                                                     </td><td>$8.75  </td></tr>\n",
       "\t<tr><td>1827</td><td>1</td><td>Chips and Guacamole</td><td>NULL                                                                                              </td><td>$4.45  </td></tr>\n",
       "\t<tr><td>1827</td><td>1</td><td>Canned Soft Drink  </td><td>[Diet Coke]                                                                                       </td><td>$1.25  </td></tr>\n",
       "\t<tr><td>1827</td><td>1</td><td>Barbacoa Burrito   </td><td>[Tomatillo Green Chili Salsa]                                                                     </td><td>$9.25  </td></tr>\n",
       "\t<tr><td>1827</td><td>1</td><td>Barbacoa Burrito   </td><td>[Tomatillo Green Chili Salsa]                                                                     </td><td>$9.25  </td></tr>\n",
       "\t<tr><td>1828</td><td>1</td><td>Chicken Bowl       </td><td>[Fresh Tomato Salsa, [Rice, Black Beans, Cheese, Sour Cream]]                                     </td><td>$8.75  </td></tr>\n",
       "\t<tr><td>1828</td><td>1</td><td>Chips and Guacamole</td><td>NULL                                                                                              </td><td>$4.45  </td></tr>\n",
       "\t<tr><td>1828</td><td>1</td><td>Canned Soft Drink  </td><td>[Coke]                                                                                            </td><td>$1.25  </td></tr>\n",
       "\t<tr><td>1829</td><td>1</td><td>Steak Burrito      </td><td>[Tomatillo Green Chili Salsa, [Rice, Cheese, Sour Cream, Guacamole]]                              </td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1829</td><td>1</td><td>Veggie Burrito     </td><td>[Tomatillo Red Chili Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Guacamole, Lettuce]]   </td><td>$11.25 </td></tr>\n",
       "\t<tr><td>1829</td><td>1</td><td>Canned Soft Drink  </td><td>[Sprite]                                                                                          </td><td>$1.25  </td></tr>\n",
       "\t<tr><td>1830</td><td>1</td><td>Steak Burrito      </td><td>[Fresh Tomato Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                              </td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1830</td><td>1</td><td>Veggie Burrito     </td><td>[Tomatillo Green Chili Salsa, [Rice, Fajita Vegetables, Black Beans, Guacamole]]                  </td><td>$11.25 </td></tr>\n",
       "\t<tr><td>1831</td><td>1</td><td>Carnitas Bowl      </td><td>[Fresh Tomato Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream, Lettuce]]         </td><td>$9.25  </td></tr>\n",
       "\t<tr><td>1831</td><td>1</td><td>Chips              </td><td>NULL                                                                                              </td><td>$2.15  </td></tr>\n",
       "\t<tr><td>1831</td><td>1</td><td>Bottled Water      </td><td>NULL                                                                                              </td><td>$1.50  </td></tr>\n",
       "\t<tr><td>1832</td><td>1</td><td>Chicken Soft Tacos </td><td>[Fresh Tomato Salsa, [Rice, Cheese, Sour Cream]]                                                  </td><td>$8.75  </td></tr>\n",
       "\t<tr><td>1832</td><td>1</td><td>Chips and Guacamole</td><td>NULL                                                                                              </td><td>$4.45  </td></tr>\n",
       "\t<tr><td>1833</td><td>1</td><td>Steak Burrito      </td><td>[Fresh Tomato Salsa, [Rice, Black Beans, Sour Cream, Cheese, Lettuce, Guacamole]]                 </td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1833</td><td>1</td><td>Steak Burrito      </td><td>[Fresh Tomato Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                              </td><td>$11.75 </td></tr>\n",
       "\t<tr><td>1834</td><td>1</td><td>Chicken Salad Bowl </td><td>[Fresh Tomato Salsa, [Fajita Vegetables, Pinto Beans, Guacamole, Lettuce]]                        </td><td>$11.25 </td></tr>\n",
       "\t<tr><td>1834</td><td>1</td><td>Chicken Salad Bowl </td><td>[Fresh Tomato Salsa, [Fajita Vegetables, Lettuce]]                                                </td><td>$8.75  </td></tr>\n",
       "\t<tr><td>1834</td><td>1</td><td>Chicken Salad Bowl </td><td>[Fresh Tomato Salsa, [Fajita Vegetables, Pinto Beans, Lettuce]]                                   </td><td>$8.75  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4622 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " order\\_id & quantity & item\\_name & choice\\_description & item\\_price\\\\\n",
       " <int> & <int> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t  1 & 1 & Chips and Fresh Tomato Salsa          & NULL                                                                                                                                      & \\$2.39  \\\\\n",
       "\t  1 & 1 & Izze                                  & {[}Clementine{]}                                                                                                                              & \\$3.39  \\\\\n",
       "\t  1 & 1 & Nantucket Nectar                      & {[}Apple{]}                                                                                                                                   & \\$3.39  \\\\\n",
       "\t  1 & 1 & Chips and Tomatillo-Green Chili Salsa & NULL                                                                                                                                      & \\$2.39  \\\\\n",
       "\t  2 & 2 & Chicken Bowl                          & {[}Tomatillo-Red Chili Salsa (Hot), {[}Black Beans, Rice, Cheese, Sour Cream{]}{]}                                                                & \\$16.98 \\\\\n",
       "\t  3 & 1 & Chicken Bowl                          & {[}Fresh Tomato Salsa (Mild), {[}Rice, Cheese, Sour Cream, Guacamole, Lettuce{]}{]}                                                               & \\$10.98 \\\\\n",
       "\t  3 & 1 & Side of Chips                         & NULL                                                                                                                                      & \\$1.69  \\\\\n",
       "\t  4 & 1 & Steak Burrito                         & {[}Tomatillo Red Chili Salsa, {[}Fajita Vegetables, Black Beans, Pinto Beans, Cheese, Sour Cream, Guacamole, Lettuce{]}{]}                        & \\$11.75 \\\\\n",
       "\t  4 & 1 & Steak Soft Tacos                      & {[}Tomatillo Green Chili Salsa, {[}Pinto Beans, Cheese, Sour Cream, Lettuce{]}{]}                                                                 & \\$9.25  \\\\\n",
       "\t  5 & 1 & Steak Burrito                         & {[}Fresh Tomato Salsa, {[}Rice, Black Beans, Pinto Beans, Cheese, Sour Cream, Lettuce{]}{]}                                                       & \\$9.25  \\\\\n",
       "\t  5 & 1 & Chips and Guacamole                   & NULL                                                                                                                                      & \\$4.45  \\\\\n",
       "\t  6 & 1 & Chicken Crispy Tacos                  & {[}Roasted Chili Corn Salsa, {[}Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream{]}{]}                                                    & \\$8.75  \\\\\n",
       "\t  6 & 1 & Chicken Soft Tacos                    & {[}Roasted Chili Corn Salsa, {[}Rice, Black Beans, Cheese, Sour Cream{]}{]}                                                                       & \\$8.75  \\\\\n",
       "\t  7 & 1 & Chicken Bowl                          & {[}Fresh Tomato Salsa, {[}Fajita Vegetables, Rice, Cheese, Sour Cream, Guacamole{]}{]}                                                            & \\$11.25 \\\\\n",
       "\t  7 & 1 & Chips and Guacamole                   & NULL                                                                                                                                      & \\$4.45  \\\\\n",
       "\t  8 & 1 & Chips and Tomatillo-Green Chili Salsa & NULL                                                                                                                                      & \\$2.39  \\\\\n",
       "\t  8 & 1 & Chicken Burrito                       & {[}Tomatillo-Green Chili Salsa (Medium), {[}Pinto Beans, Cheese, Sour Cream{]}{]}                                                                 & \\$8.49  \\\\\n",
       "\t  9 & 1 & Chicken Burrito                       & {[}Fresh Tomato Salsa (Mild), {[}Black Beans, Rice, Cheese, Sour Cream, Lettuce{]}{]}                                                             & \\$8.49  \\\\\n",
       "\t  9 & 2 & Canned Soda                           & {[}Sprite{]}                                                                                                                                  & \\$2.18  \\\\\n",
       "\t 10 & 1 & Chicken Bowl                          & {[}Tomatillo Red Chili Salsa, {[}Fajita Vegetables, Black Beans, Sour Cream, Cheese, Lettuce{]}{]}                                                & \\$8.75  \\\\\n",
       "\t 10 & 1 & Chips and Guacamole                   & NULL                                                                                                                                      & \\$4.45  \\\\\n",
       "\t 11 & 1 & Barbacoa Burrito                      & {[}{[}Fresh Tomato Salsa (Mild), Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot){]}, {[}Rice, Cheese, Sour Cream, Lettuce{]}{]} & \\$8.99  \\\\\n",
       "\t 11 & 1 & Nantucket Nectar                      & {[}Pomegranate Cherry{]}                                                                                                                      & \\$3.39  \\\\\n",
       "\t 12 & 1 & Chicken Burrito                       & {[}{[}Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot){]}, {[}Pinto Beans, Rice, Cheese, Sour Cream, Guacamole, Lettuce{]}{]}    & \\$10.98 \\\\\n",
       "\t 12 & 1 & Izze                                  & {[}Grapefruit{]}                                                                                                                              & \\$3.39  \\\\\n",
       "\t 13 & 1 & Chips and Fresh Tomato Salsa          & NULL                                                                                                                                      & \\$2.39  \\\\\n",
       "\t 13 & 1 & Chicken Bowl                          & {[}Roasted Chili Corn Salsa (Medium), {[}Pinto Beans, Rice, Fajita Veggies, Cheese, Sour Cream, Lettuce{]}{]}                                     & \\$8.49  \\\\\n",
       "\t 14 & 1 & Carnitas Burrito                      & {[}{[}Tomatillo-Green Chili Salsa (Medium), Roasted Chili Corn Salsa (Medium){]}, {[}Black Beans, Rice, Sour Cream, Lettuce{]}{]}                     & \\$8.99  \\\\\n",
       "\t 14 & 1 & Canned Soda                           & {[}Dr. Pepper{]}                                                                                                                              & \\$1.09  \\\\\n",
       "\t 15 & 1 & Chicken Burrito                       & {[}Tomatillo-Green Chili Salsa (Medium), {[}Pinto Beans, Rice, Cheese, Sour Cream{]}{]}                                                           & \\$8.49  \\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 1825 & 1 & Barbacoa Burrito    & {[}Tomatillo Red Chili Salsa, {[}Rice, Fajita Vegetables, Black Beans, Sour Cream, Cheese, Guacamole{]}{]} & \\$11.75 \\\\\n",
       "\t 1825 & 1 & Carnitas Bowl       & {[}Roasted Chili Corn Salsa, {[}Rice, Sour Cream, Cheese, Lettuce, Guacamole{]}{]}                         & \\$11.75 \\\\\n",
       "\t 1825 & 1 & Barbacoa Bowl       & {[}Roasted Chili Corn Salsa, {[}Pinto Beans, Sour Cream, Cheese, Lettuce, Guacamole{]}{]}                  & \\$11.75 \\\\\n",
       "\t 1826 & 1 & Chicken Bowl        & {[}Tomatillo Green Chili Salsa, {[}Rice, Black Beans{]}{]}                                                 & \\$8.75  \\\\\n",
       "\t 1826 & 1 & Chips and Guacamole & NULL                                                                                               & \\$4.45  \\\\\n",
       "\t 1826 & 1 & Canned Soft Drink   & {[}Nestea{]}                                                                                           & \\$1.25  \\\\\n",
       "\t 1826 & 1 & Bottled Water       & NULL                                                                                               & \\$1.50  \\\\\n",
       "\t 1827 & 1 & Chicken Bowl        & {[}Roasted Chili Corn Salsa, {[}Cheese, Lettuce{]}{]}                                                      & \\$8.75  \\\\\n",
       "\t 1827 & 1 & Chips and Guacamole & NULL                                                                                               & \\$4.45  \\\\\n",
       "\t 1827 & 1 & Canned Soft Drink   & {[}Diet Coke{]}                                                                                        & \\$1.25  \\\\\n",
       "\t 1827 & 1 & Barbacoa Burrito    & {[}Tomatillo Green Chili Salsa{]}                                                                      & \\$9.25  \\\\\n",
       "\t 1827 & 1 & Barbacoa Burrito    & {[}Tomatillo Green Chili Salsa{]}                                                                      & \\$9.25  \\\\\n",
       "\t 1828 & 1 & Chicken Bowl        & {[}Fresh Tomato Salsa, {[}Rice, Black Beans, Cheese, Sour Cream{]}{]}                                      & \\$8.75  \\\\\n",
       "\t 1828 & 1 & Chips and Guacamole & NULL                                                                                               & \\$4.45  \\\\\n",
       "\t 1828 & 1 & Canned Soft Drink   & {[}Coke{]}                                                                                             & \\$1.25  \\\\\n",
       "\t 1829 & 1 & Steak Burrito       & {[}Tomatillo Green Chili Salsa, {[}Rice, Cheese, Sour Cream, Guacamole{]}{]}                               & \\$11.75 \\\\\n",
       "\t 1829 & 1 & Veggie Burrito      & {[}Tomatillo Red Chili Salsa, {[}Fajita Vegetables, Rice, Black Beans, Cheese, Guacamole, Lettuce{]}{]}    & \\$11.25 \\\\\n",
       "\t 1829 & 1 & Canned Soft Drink   & {[}Sprite{]}                                                                                           & \\$1.25  \\\\\n",
       "\t 1830 & 1 & Steak Burrito       & {[}Fresh Tomato Salsa, {[}Rice, Sour Cream, Cheese, Lettuce, Guacamole{]}{]}                               & \\$11.75 \\\\\n",
       "\t 1830 & 1 & Veggie Burrito      & {[}Tomatillo Green Chili Salsa, {[}Rice, Fajita Vegetables, Black Beans, Guacamole{]}{]}                   & \\$11.25 \\\\\n",
       "\t 1831 & 1 & Carnitas Bowl       & {[}Fresh Tomato Salsa, {[}Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream, Lettuce{]}{]}          & \\$9.25  \\\\\n",
       "\t 1831 & 1 & Chips               & NULL                                                                                               & \\$2.15  \\\\\n",
       "\t 1831 & 1 & Bottled Water       & NULL                                                                                               & \\$1.50  \\\\\n",
       "\t 1832 & 1 & Chicken Soft Tacos  & {[}Fresh Tomato Salsa, {[}Rice, Cheese, Sour Cream{]}{]}                                                   & \\$8.75  \\\\\n",
       "\t 1832 & 1 & Chips and Guacamole & NULL                                                                                               & \\$4.45  \\\\\n",
       "\t 1833 & 1 & Steak Burrito       & {[}Fresh Tomato Salsa, {[}Rice, Black Beans, Sour Cream, Cheese, Lettuce, Guacamole{]}{]}                  & \\$11.75 \\\\\n",
       "\t 1833 & 1 & Steak Burrito       & {[}Fresh Tomato Salsa, {[}Rice, Sour Cream, Cheese, Lettuce, Guacamole{]}{]}                               & \\$11.75 \\\\\n",
       "\t 1834 & 1 & Chicken Salad Bowl  & {[}Fresh Tomato Salsa, {[}Fajita Vegetables, Pinto Beans, Guacamole, Lettuce{]}{]}                         & \\$11.25 \\\\\n",
       "\t 1834 & 1 & Chicken Salad Bowl  & {[}Fresh Tomato Salsa, {[}Fajita Vegetables, Lettuce{]}{]}                                                 & \\$8.75  \\\\\n",
       "\t 1834 & 1 & Chicken Salad Bowl  & {[}Fresh Tomato Salsa, {[}Fajita Vegetables, Pinto Beans, Lettuce{]}{]}                                    & \\$8.75  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4622 × 5\n",
       "\n",
       "| order_id &lt;int&gt; | quantity &lt;int&gt; | item_name &lt;chr&gt; | choice_description &lt;chr&gt; | item_price &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "|  1 | 1 | Chips and Fresh Tomato Salsa          | NULL                                                                                                                                      | $2.39   |\n",
       "|  1 | 1 | Izze                                  | [Clementine]                                                                                                                              | $3.39   |\n",
       "|  1 | 1 | Nantucket Nectar                      | [Apple]                                                                                                                                   | $3.39   |\n",
       "|  1 | 1 | Chips and Tomatillo-Green Chili Salsa | NULL                                                                                                                                      | $2.39   |\n",
       "|  2 | 2 | Chicken Bowl                          | [Tomatillo-Red Chili Salsa (Hot), [Black Beans, Rice, Cheese, Sour Cream]]                                                                | $16.98  |\n",
       "|  3 | 1 | Chicken Bowl                          | [Fresh Tomato Salsa (Mild), [Rice, Cheese, Sour Cream, Guacamole, Lettuce]]                                                               | $10.98  |\n",
       "|  3 | 1 | Side of Chips                         | NULL                                                                                                                                      | $1.69   |\n",
       "|  4 | 1 | Steak Burrito                         | [Tomatillo Red Chili Salsa, [Fajita Vegetables, Black Beans, Pinto Beans, Cheese, Sour Cream, Guacamole, Lettuce]]                        | $11.75  |\n",
       "|  4 | 1 | Steak Soft Tacos                      | [Tomatillo Green Chili Salsa, [Pinto Beans, Cheese, Sour Cream, Lettuce]]                                                                 | $9.25   |\n",
       "|  5 | 1 | Steak Burrito                         | [Fresh Tomato Salsa, [Rice, Black Beans, Pinto Beans, Cheese, Sour Cream, Lettuce]]                                                       | $9.25   |\n",
       "|  5 | 1 | Chips and Guacamole                   | NULL                                                                                                                                      | $4.45   |\n",
       "|  6 | 1 | Chicken Crispy Tacos                  | [Roasted Chili Corn Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream]]                                                    | $8.75   |\n",
       "|  6 | 1 | Chicken Soft Tacos                    | [Roasted Chili Corn Salsa, [Rice, Black Beans, Cheese, Sour Cream]]                                                                       | $8.75   |\n",
       "|  7 | 1 | Chicken Bowl                          | [Fresh Tomato Salsa, [Fajita Vegetables, Rice, Cheese, Sour Cream, Guacamole]]                                                            | $11.25  |\n",
       "|  7 | 1 | Chips and Guacamole                   | NULL                                                                                                                                      | $4.45   |\n",
       "|  8 | 1 | Chips and Tomatillo-Green Chili Salsa | NULL                                                                                                                                      | $2.39   |\n",
       "|  8 | 1 | Chicken Burrito                       | [Tomatillo-Green Chili Salsa (Medium), [Pinto Beans, Cheese, Sour Cream]]                                                                 | $8.49   |\n",
       "|  9 | 1 | Chicken Burrito                       | [Fresh Tomato Salsa (Mild), [Black Beans, Rice, Cheese, Sour Cream, Lettuce]]                                                             | $8.49   |\n",
       "|  9 | 2 | Canned Soda                           | [Sprite]                                                                                                                                  | $2.18   |\n",
       "| 10 | 1 | Chicken Bowl                          | [Tomatillo Red Chili Salsa, [Fajita Vegetables, Black Beans, Sour Cream, Cheese, Lettuce]]                                                | $8.75   |\n",
       "| 10 | 1 | Chips and Guacamole                   | NULL                                                                                                                                      | $4.45   |\n",
       "| 11 | 1 | Barbacoa Burrito                      | [[Fresh Tomato Salsa (Mild), Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot)], [Rice, Cheese, Sour Cream, Lettuce]] | $8.99   |\n",
       "| 11 | 1 | Nantucket Nectar                      | [Pomegranate Cherry]                                                                                                                      | $3.39   |\n",
       "| 12 | 1 | Chicken Burrito                       | [[Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot)], [Pinto Beans, Rice, Cheese, Sour Cream, Guacamole, Lettuce]]    | $10.98  |\n",
       "| 12 | 1 | Izze                                  | [Grapefruit]                                                                                                                              | $3.39   |\n",
       "| 13 | 1 | Chips and Fresh Tomato Salsa          | NULL                                                                                                                                      | $2.39   |\n",
       "| 13 | 1 | Chicken Bowl                          | [Roasted Chili Corn Salsa (Medium), [Pinto Beans, Rice, Fajita Veggies, Cheese, Sour Cream, Lettuce]]                                     | $8.49   |\n",
       "| 14 | 1 | Carnitas Burrito                      | [[Tomatillo-Green Chili Salsa (Medium), Roasted Chili Corn Salsa (Medium)], [Black Beans, Rice, Sour Cream, Lettuce]]                     | $8.99   |\n",
       "| 14 | 1 | Canned Soda                           | [Dr. Pepper]                                                                                                                              | $1.09   |\n",
       "| 15 | 1 | Chicken Burrito                       | [Tomatillo-Green Chili Salsa (Medium), [Pinto Beans, Rice, Cheese, Sour Cream]]                                                           | $8.49   |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 1825 | 1 | Barbacoa Burrito    | [Tomatillo Red Chili Salsa, [Rice, Fajita Vegetables, Black Beans, Sour Cream, Cheese, Guacamole]] | $11.75  |\n",
       "| 1825 | 1 | Carnitas Bowl       | [Roasted Chili Corn Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                         | $11.75  |\n",
       "| 1825 | 1 | Barbacoa Bowl       | [Roasted Chili Corn Salsa, [Pinto Beans, Sour Cream, Cheese, Lettuce, Guacamole]]                  | $11.75  |\n",
       "| 1826 | 1 | Chicken Bowl        | [Tomatillo Green Chili Salsa, [Rice, Black Beans]]                                                 | $8.75   |\n",
       "| 1826 | 1 | Chips and Guacamole | NULL                                                                                               | $4.45   |\n",
       "| 1826 | 1 | Canned Soft Drink   | [Nestea]                                                                                           | $1.25   |\n",
       "| 1826 | 1 | Bottled Water       | NULL                                                                                               | $1.50   |\n",
       "| 1827 | 1 | Chicken Bowl        | [Roasted Chili Corn Salsa, [Cheese, Lettuce]]                                                      | $8.75   |\n",
       "| 1827 | 1 | Chips and Guacamole | NULL                                                                                               | $4.45   |\n",
       "| 1827 | 1 | Canned Soft Drink   | [Diet Coke]                                                                                        | $1.25   |\n",
       "| 1827 | 1 | Barbacoa Burrito    | [Tomatillo Green Chili Salsa]                                                                      | $9.25   |\n",
       "| 1827 | 1 | Barbacoa Burrito    | [Tomatillo Green Chili Salsa]                                                                      | $9.25   |\n",
       "| 1828 | 1 | Chicken Bowl        | [Fresh Tomato Salsa, [Rice, Black Beans, Cheese, Sour Cream]]                                      | $8.75   |\n",
       "| 1828 | 1 | Chips and Guacamole | NULL                                                                                               | $4.45   |\n",
       "| 1828 | 1 | Canned Soft Drink   | [Coke]                                                                                             | $1.25   |\n",
       "| 1829 | 1 | Steak Burrito       | [Tomatillo Green Chili Salsa, [Rice, Cheese, Sour Cream, Guacamole]]                               | $11.75  |\n",
       "| 1829 | 1 | Veggie Burrito      | [Tomatillo Red Chili Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Guacamole, Lettuce]]    | $11.25  |\n",
       "| 1829 | 1 | Canned Soft Drink   | [Sprite]                                                                                           | $1.25   |\n",
       "| 1830 | 1 | Steak Burrito       | [Fresh Tomato Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                               | $11.75  |\n",
       "| 1830 | 1 | Veggie Burrito      | [Tomatillo Green Chili Salsa, [Rice, Fajita Vegetables, Black Beans, Guacamole]]                   | $11.25  |\n",
       "| 1831 | 1 | Carnitas Bowl       | [Fresh Tomato Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream, Lettuce]]          | $9.25   |\n",
       "| 1831 | 1 | Chips               | NULL                                                                                               | $2.15   |\n",
       "| 1831 | 1 | Bottled Water       | NULL                                                                                               | $1.50   |\n",
       "| 1832 | 1 | Chicken Soft Tacos  | [Fresh Tomato Salsa, [Rice, Cheese, Sour Cream]]                                                   | $8.75   |\n",
       "| 1832 | 1 | Chips and Guacamole | NULL                                                                                               | $4.45   |\n",
       "| 1833 | 1 | Steak Burrito       | [Fresh Tomato Salsa, [Rice, Black Beans, Sour Cream, Cheese, Lettuce, Guacamole]]                  | $11.75  |\n",
       "| 1833 | 1 | Steak Burrito       | [Fresh Tomato Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                               | $11.75  |\n",
       "| 1834 | 1 | Chicken Salad Bowl  | [Fresh Tomato Salsa, [Fajita Vegetables, Pinto Beans, Guacamole, Lettuce]]                         | $11.25  |\n",
       "| 1834 | 1 | Chicken Salad Bowl  | [Fresh Tomato Salsa, [Fajita Vegetables, Lettuce]]                                                 | $8.75   |\n",
       "| 1834 | 1 | Chicken Salad Bowl  | [Fresh Tomato Salsa, [Fajita Vegetables, Pinto Beans, Lettuce]]                                    | $8.75   |\n",
       "\n"
      ],
      "text/plain": [
       "     order_id quantity item_name                            \n",
       "1     1       1        Chips and Fresh Tomato Salsa         \n",
       "2     1       1        Izze                                 \n",
       "3     1       1        Nantucket Nectar                     \n",
       "4     1       1        Chips and Tomatillo-Green Chili Salsa\n",
       "5     2       2        Chicken Bowl                         \n",
       "6     3       1        Chicken Bowl                         \n",
       "7     3       1        Side of Chips                        \n",
       "8     4       1        Steak Burrito                        \n",
       "9     4       1        Steak Soft Tacos                     \n",
       "10    5       1        Steak Burrito                        \n",
       "11    5       1        Chips and Guacamole                  \n",
       "12    6       1        Chicken Crispy Tacos                 \n",
       "13    6       1        Chicken Soft Tacos                   \n",
       "14    7       1        Chicken Bowl                         \n",
       "15    7       1        Chips and Guacamole                  \n",
       "16    8       1        Chips and Tomatillo-Green Chili Salsa\n",
       "17    8       1        Chicken Burrito                      \n",
       "18    9       1        Chicken Burrito                      \n",
       "19    9       2        Canned Soda                          \n",
       "20   10       1        Chicken Bowl                         \n",
       "21   10       1        Chips and Guacamole                  \n",
       "22   11       1        Barbacoa Burrito                     \n",
       "23   11       1        Nantucket Nectar                     \n",
       "24   12       1        Chicken Burrito                      \n",
       "25   12       1        Izze                                 \n",
       "26   13       1        Chips and Fresh Tomato Salsa         \n",
       "27   13       1        Chicken Bowl                         \n",
       "28   14       1        Carnitas Burrito                     \n",
       "29   14       1        Canned Soda                          \n",
       "30   15       1        Chicken Burrito                      \n",
       "⋮    ⋮        ⋮        ⋮                                    \n",
       "4593 1825     1        Barbacoa Burrito                     \n",
       "4594 1825     1        Carnitas Bowl                        \n",
       "4595 1825     1        Barbacoa Bowl                        \n",
       "4596 1826     1        Chicken Bowl                         \n",
       "4597 1826     1        Chips and Guacamole                  \n",
       "4598 1826     1        Canned Soft Drink                    \n",
       "4599 1826     1        Bottled Water                        \n",
       "4600 1827     1        Chicken Bowl                         \n",
       "4601 1827     1        Chips and Guacamole                  \n",
       "4602 1827     1        Canned Soft Drink                    \n",
       "4603 1827     1        Barbacoa Burrito                     \n",
       "4604 1827     1        Barbacoa Burrito                     \n",
       "4605 1828     1        Chicken Bowl                         \n",
       "4606 1828     1        Chips and Guacamole                  \n",
       "4607 1828     1        Canned Soft Drink                    \n",
       "4608 1829     1        Steak Burrito                        \n",
       "4609 1829     1        Veggie Burrito                       \n",
       "4610 1829     1        Canned Soft Drink                    \n",
       "4611 1830     1        Steak Burrito                        \n",
       "4612 1830     1        Veggie Burrito                       \n",
       "4613 1831     1        Carnitas Bowl                        \n",
       "4614 1831     1        Chips                                \n",
       "4615 1831     1        Bottled Water                        \n",
       "4616 1832     1        Chicken Soft Tacos                   \n",
       "4617 1832     1        Chips and Guacamole                  \n",
       "4618 1833     1        Steak Burrito                        \n",
       "4619 1833     1        Steak Burrito                        \n",
       "4620 1834     1        Chicken Salad Bowl                   \n",
       "4621 1834     1        Chicken Salad Bowl                   \n",
       "4622 1834     1        Chicken Salad Bowl                   \n",
       "     choice_description                                                                                                                       \n",
       "1    NULL                                                                                                                                     \n",
       "2    [Clementine]                                                                                                                             \n",
       "3    [Apple]                                                                                                                                  \n",
       "4    NULL                                                                                                                                     \n",
       "5    [Tomatillo-Red Chili Salsa (Hot), [Black Beans, Rice, Cheese, Sour Cream]]                                                               \n",
       "6    [Fresh Tomato Salsa (Mild), [Rice, Cheese, Sour Cream, Guacamole, Lettuce]]                                                              \n",
       "7    NULL                                                                                                                                     \n",
       "8    [Tomatillo Red Chili Salsa, [Fajita Vegetables, Black Beans, Pinto Beans, Cheese, Sour Cream, Guacamole, Lettuce]]                       \n",
       "9    [Tomatillo Green Chili Salsa, [Pinto Beans, Cheese, Sour Cream, Lettuce]]                                                                \n",
       "10   [Fresh Tomato Salsa, [Rice, Black Beans, Pinto Beans, Cheese, Sour Cream, Lettuce]]                                                      \n",
       "11   NULL                                                                                                                                     \n",
       "12   [Roasted Chili Corn Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream]]                                                   \n",
       "13   [Roasted Chili Corn Salsa, [Rice, Black Beans, Cheese, Sour Cream]]                                                                      \n",
       "14   [Fresh Tomato Salsa, [Fajita Vegetables, Rice, Cheese, Sour Cream, Guacamole]]                                                           \n",
       "15   NULL                                                                                                                                     \n",
       "16   NULL                                                                                                                                     \n",
       "17   [Tomatillo-Green Chili Salsa (Medium), [Pinto Beans, Cheese, Sour Cream]]                                                                \n",
       "18   [Fresh Tomato Salsa (Mild), [Black Beans, Rice, Cheese, Sour Cream, Lettuce]]                                                            \n",
       "19   [Sprite]                                                                                                                                 \n",
       "20   [Tomatillo Red Chili Salsa, [Fajita Vegetables, Black Beans, Sour Cream, Cheese, Lettuce]]                                               \n",
       "21   NULL                                                                                                                                     \n",
       "22   [[Fresh Tomato Salsa (Mild), Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot)], [Rice, Cheese, Sour Cream, Lettuce]]\n",
       "23   [Pomegranate Cherry]                                                                                                                     \n",
       "24   [[Tomatillo-Green Chili Salsa (Medium), Tomatillo-Red Chili Salsa (Hot)], [Pinto Beans, Rice, Cheese, Sour Cream, Guacamole, Lettuce]]   \n",
       "25   [Grapefruit]                                                                                                                             \n",
       "26   NULL                                                                                                                                     \n",
       "27   [Roasted Chili Corn Salsa (Medium), [Pinto Beans, Rice, Fajita Veggies, Cheese, Sour Cream, Lettuce]]                                    \n",
       "28   [[Tomatillo-Green Chili Salsa (Medium), Roasted Chili Corn Salsa (Medium)], [Black Beans, Rice, Sour Cream, Lettuce]]                    \n",
       "29   [Dr. Pepper]                                                                                                                             \n",
       "30   [Tomatillo-Green Chili Salsa (Medium), [Pinto Beans, Rice, Cheese, Sour Cream]]                                                          \n",
       "⋮    ⋮                                                                                                                                        \n",
       "4593 [Tomatillo Red Chili Salsa, [Rice, Fajita Vegetables, Black Beans, Sour Cream, Cheese, Guacamole]]                                       \n",
       "4594 [Roasted Chili Corn Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                                                               \n",
       "4595 [Roasted Chili Corn Salsa, [Pinto Beans, Sour Cream, Cheese, Lettuce, Guacamole]]                                                        \n",
       "4596 [Tomatillo Green Chili Salsa, [Rice, Black Beans]]                                                                                       \n",
       "4597 NULL                                                                                                                                     \n",
       "4598 [Nestea]                                                                                                                                 \n",
       "4599 NULL                                                                                                                                     \n",
       "4600 [Roasted Chili Corn Salsa, [Cheese, Lettuce]]                                                                                            \n",
       "4601 NULL                                                                                                                                     \n",
       "4602 [Diet Coke]                                                                                                                              \n",
       "4603 [Tomatillo Green Chili Salsa]                                                                                                            \n",
       "4604 [Tomatillo Green Chili Salsa]                                                                                                            \n",
       "4605 [Fresh Tomato Salsa, [Rice, Black Beans, Cheese, Sour Cream]]                                                                            \n",
       "4606 NULL                                                                                                                                     \n",
       "4607 [Coke]                                                                                                                                   \n",
       "4608 [Tomatillo Green Chili Salsa, [Rice, Cheese, Sour Cream, Guacamole]]                                                                     \n",
       "4609 [Tomatillo Red Chili Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Guacamole, Lettuce]]                                          \n",
       "4610 [Sprite]                                                                                                                                 \n",
       "4611 [Fresh Tomato Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                                                                     \n",
       "4612 [Tomatillo Green Chili Salsa, [Rice, Fajita Vegetables, Black Beans, Guacamole]]                                                         \n",
       "4613 [Fresh Tomato Salsa, [Fajita Vegetables, Rice, Black Beans, Cheese, Sour Cream, Lettuce]]                                                \n",
       "4614 NULL                                                                                                                                     \n",
       "4615 NULL                                                                                                                                     \n",
       "4616 [Fresh Tomato Salsa, [Rice, Cheese, Sour Cream]]                                                                                         \n",
       "4617 NULL                                                                                                                                     \n",
       "4618 [Fresh Tomato Salsa, [Rice, Black Beans, Sour Cream, Cheese, Lettuce, Guacamole]]                                                        \n",
       "4619 [Fresh Tomato Salsa, [Rice, Sour Cream, Cheese, Lettuce, Guacamole]]                                                                     \n",
       "4620 [Fresh Tomato Salsa, [Fajita Vegetables, Pinto Beans, Guacamole, Lettuce]]                                                               \n",
       "4621 [Fresh Tomato Salsa, [Fajita Vegetables, Lettuce]]                                                                                       \n",
       "4622 [Fresh Tomato Salsa, [Fajita Vegetables, Pinto Beans, Lettuce]]                                                                          \n",
       "     item_price\n",
       "1    $2.39     \n",
       "2    $3.39     \n",
       "3    $3.39     \n",
       "4    $2.39     \n",
       "5    $16.98    \n",
       "6    $10.98    \n",
       "7    $1.69     \n",
       "8    $11.75    \n",
       "9    $9.25     \n",
       "10   $9.25     \n",
       "11   $4.45     \n",
       "12   $8.75     \n",
       "13   $8.75     \n",
       "14   $11.25    \n",
       "15   $4.45     \n",
       "16   $2.39     \n",
       "17   $8.49     \n",
       "18   $8.49     \n",
       "19   $2.18     \n",
       "20   $8.75     \n",
       "21   $4.45     \n",
       "22   $8.99     \n",
       "23   $3.39     \n",
       "24   $10.98    \n",
       "25   $3.39     \n",
       "26   $2.39     \n",
       "27   $8.49     \n",
       "28   $8.99     \n",
       "29   $1.09     \n",
       "30   $8.49     \n",
       "⋮    ⋮         \n",
       "4593 $11.75    \n",
       "4594 $11.75    \n",
       "4595 $11.75    \n",
       "4596 $8.75     \n",
       "4597 $4.45     \n",
       "4598 $1.25     \n",
       "4599 $1.50     \n",
       "4600 $8.75     \n",
       "4601 $4.45     \n",
       "4602 $1.25     \n",
       "4603 $9.25     \n",
       "4604 $9.25     \n",
       "4605 $8.75     \n",
       "4606 $4.45     \n",
       "4607 $1.25     \n",
       "4608 $11.75    \n",
       "4609 $11.25    \n",
       "4610 $1.25     \n",
       "4611 $11.75    \n",
       "4612 $11.25    \n",
       "4613 $9.25     \n",
       "4614 $2.15     \n",
       "4615 $1.50     \n",
       "4616 $8.75     \n",
       "4617 $4.45     \n",
       "4618 $11.75    \n",
       "4619 $11.75    \n",
       "4620 $11.25    \n",
       "4621 $8.75     \n",
       "4622 $8.75     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "View(chipotle_df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a5e10460",
   "metadata": {
    "_cell_guid": "25470587-6c71-46be-aa89-068aeb773807",
    "_uuid": "cdd65d0a-929f-42b0-aa48-dabbf614fb95",
    "papermill": {
     "duration": 0.009581,
     "end_time": "2023-05-25T20:43:38.589862",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.580281",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 1. Which was the most-ordered item?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b1ed03af",
   "metadata": {
    "_cell_guid": "54a27efa-7a3f-4c54-8c63-d753f2aac762",
    "_uuid": "4f8407fc-dab6-4587-b855-56a02c66ec83",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:38.613192Z",
     "iopub.status.busy": "2023-05-25T20:43:38.611412Z",
     "iopub.status.idle": "2023-05-25T20:43:38.673385Z",
     "shell.execute_reply": "2023-05-25T20:43:38.670926Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.077311,
     "end_time": "2023-05-25T20:43:38.676729",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.599418",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>item_name</th><th scope=col>quantity</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Chicken Bowl</td><td>761</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " item\\_name & quantity\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Chicken Bowl & 761\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| item_name &lt;chr&gt; | quantity &lt;int&gt; |\n",
       "|---|---|\n",
       "| Chicken Bowl | 761 |\n",
       "\n"
      ],
      "text/plain": [
       "  item_name    quantity\n",
       "1 Chicken Bowl 761     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#group the data by the item names and sum the total quantity\n",
    "grouped_chipotle_df <- chipotle_df %>% group_by(item_name) %>% \n",
    "summarise(quantity = sum(quantity)) %>% arrange(-quantity)\n",
    "\n",
    "#return the top highest value\n",
    "head(grouped_chipotle_df,1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "05941729",
   "metadata": {
    "_cell_guid": "97b5a3f2-83b1-4121-9a15-95a99cc025a0",
    "_uuid": "b8a3ba72-5813-4aab-84c6-4a88f0c5e082",
    "papermill": {
     "duration": 0.009623,
     "end_time": "2023-05-25T20:43:38.696140",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.686517",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 2. For the most-ordered item, how many items were ordered?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "3a604387",
   "metadata": {
    "_cell_guid": "a598e05e-0d41-4fdf-9b7a-a3af73eaee57",
    "_uuid": "24394ea2-8189-4c79-b85a-d8ff00f4a65c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:38.719571Z",
     "iopub.status.busy": "2023-05-25T20:43:38.717652Z",
     "iopub.status.idle": "2023-05-25T20:43:38.737524Z",
     "shell.execute_reply": "2023-05-25T20:43:38.735543Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.034343,
     "end_time": "2023-05-25T20:43:38.740045",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.705702",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "761"
      ],
      "text/latex": [
       "761"
      ],
      "text/markdown": [
       "761"
      ],
      "text/plain": [
       "[1] 761"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "max(grouped_chipotle_df$quantity)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "41f60ee3",
   "metadata": {
    "_cell_guid": "c53eba8b-475a-4c46-955f-57bc48a0ec8c",
    "_uuid": "3945e78d-d2a6-4bec-8166-f3c7eb2eb738",
    "papermill": {
     "duration": 0.010191,
     "end_time": "2023-05-25T20:43:38.760167",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.749976",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 3. What was the most ordered item in the choice_description column?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "dde8682a",
   "metadata": {
    "_cell_guid": "a15c1831-931c-47c6-a46e-77cdd414c425",
    "_uuid": "d6fd733d-f5e3-4102-a231-583ff6d50307",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:38.784544Z",
     "iopub.status.busy": "2023-05-25T20:43:38.782695Z",
     "iopub.status.idle": "2023-05-25T20:43:38.840806Z",
     "shell.execute_reply": "2023-05-25T20:43:38.838732Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.073444,
     "end_time": "2023-05-25T20:43:38.843456",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.770012",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>choice_description</th><th scope=col>total_count</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>[Diet Coke]</td><td>134</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " choice\\_description & total\\_count\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t {[}Diet Coke{]} & 134\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| choice_description &lt;chr&gt; | total_count &lt;int&gt; |\n",
       "|---|---|\n",
       "| [Diet Coke] | 134 |\n",
       "\n"
      ],
      "text/plain": [
       "  choice_description total_count\n",
       "1 [Diet Coke]        134        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#change all NULL values to NA\n",
    "chipotle_df[chipotle_df==\"NULL\"] <- NA\n",
    "\n",
    "#omit all NA values during the grouping and count\n",
    "choice_chipotle_df <- na.omit(chipotle_df) %>% group_by(choice_description) %>% \n",
    "summarise(total_count=n(),.groups = 'drop') %>% arrange(-total_count)\n",
    "\n",
    "#return top highest value\n",
    "head(choice_chipotle_df,1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c743a052",
   "metadata": {
    "_cell_guid": "83208405-ee8e-4848-b59a-2dbb15c12e1a",
    "_uuid": "79ec1251-28e5-41bf-8804-6c09efba5128",
    "papermill": {
     "duration": 0.009966,
     "end_time": "2023-05-25T20:43:38.863725",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.853759",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 4. How many items were ordered in total?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "e650c2ef",
   "metadata": {
    "_cell_guid": "efdbe364-7dad-416b-9bc3-b62ff7726f22",
    "_uuid": "dd0db3b0-b1b2-42fb-aae5-b8d5bf385b7b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:38.887758Z",
     "iopub.status.busy": "2023-05-25T20:43:38.885864Z",
     "iopub.status.idle": "2023-05-25T20:43:38.930842Z",
     "shell.execute_reply": "2023-05-25T20:43:38.904090Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.060194,
     "end_time": "2023-05-25T20:43:38.933977",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.873783",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "4972"
      ],
      "text/latex": [
       "4972"
      ],
      "text/markdown": [
       "4972"
      ],
      "text/plain": [
       "[1] 4972"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(chipotle_df$quantity)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "acdf578e",
   "metadata": {
    "_cell_guid": "9ef8bbf6-f82d-4927-bf1b-baa73eb891d6",
    "_uuid": "e5b0bd5c-c005-421e-b9c7-f5336448a50a",
    "papermill": {
     "duration": 0.010279,
     "end_time": "2023-05-25T20:43:38.955627",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.945348",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 5. Turn the item price into a float."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "748df847",
   "metadata": {
    "_cell_guid": "efe9748a-3ec2-4947-9ea3-14fb0506b1d1",
    "_uuid": "17e2f638-4647-4cb2-bbc8-124315cd0ad2",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:38.980333Z",
     "iopub.status.busy": "2023-05-25T20:43:38.978361Z",
     "iopub.status.idle": "2023-05-25T20:43:39.015562Z",
     "shell.execute_reply": "2023-05-25T20:43:39.013158Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.052428,
     "end_time": "2023-05-25T20:43:39.018287",
     "exception": false,
     "start_time": "2023-05-25T20:43:38.965859",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t4622 obs. of  5 variables:\n",
      " $ order_id          : int  1 1 1 1 2 3 3 4 4 5 ...\n",
      " $ quantity          : int  1 1 1 1 2 1 1 1 1 1 ...\n",
      " $ item_name         : chr  \"Chips and Fresh Tomato Salsa\" \"Izze\" \"Nantucket Nectar\" \"Chips and Tomatillo-Green Chili Salsa\" ...\n",
      " $ choice_description: chr  NA \"[Clementine]\" \"[Apple]\" NA ...\n",
      " $ item_price        : num  2.39 3.39 3.39 2.39 16.98 ...\n"
     ]
    }
   ],
   "source": [
    "#omit the dollar sign then convert item price to float\n",
    "chipotle_df$item_price <- as.double(gsub('[$,]','', chipotle_df$item_price))\n",
    "str(chipotle_df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c8489657",
   "metadata": {
    "_cell_guid": "ca7f8d3e-cc81-479e-becc-1ef2379b2461",
    "_uuid": "7c8d01f0-3844-4d66-b196-6e63fe62f442",
    "papermill": {
     "duration": 0.010359,
     "end_time": "2023-05-25T20:43:39.039202",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.028843",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 6. How much was the revenue for the period in the dataset?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "6981927b",
   "metadata": {
    "_cell_guid": "18f915a7-2c3e-49f2-bc07-5036d9d320b2",
    "_uuid": "b5706a08-2839-465b-9081-6fe9f1cc4c03",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:39.064330Z",
     "iopub.status.busy": "2023-05-25T20:43:39.062397Z",
     "iopub.status.idle": "2023-05-25T20:43:39.082207Z",
     "shell.execute_reply": "2023-05-25T20:43:39.079983Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.035574,
     "end_time": "2023-05-25T20:43:39.085282",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.049708",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "34500.16"
      ],
      "text/latex": [
       "34500.16"
      ],
      "text/markdown": [
       "34500.16"
      ],
      "text/plain": [
       "[1] 34500.16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(chipotle_df$item_price)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c68d0b53",
   "metadata": {
    "_cell_guid": "5658b5f5-824e-4b6e-ae02-4b7198336bbb",
    "_uuid": "98b3010d-737e-437f-8829-d7a3d55cd40b",
    "papermill": {
     "duration": 0.010823,
     "end_time": "2023-05-25T20:43:39.106956",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.096133",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 7. How many orders were made in the period?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "9ddd8e0e",
   "metadata": {
    "_cell_guid": "a6b9bc23-e061-419f-a932-70837a5db0e1",
    "_uuid": "2c5eb4d1-1a1c-45ea-98bd-5a30372760fd",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:39.132338Z",
     "iopub.status.busy": "2023-05-25T20:43:39.130467Z",
     "iopub.status.idle": "2023-05-25T20:43:39.150640Z",
     "shell.execute_reply": "2023-05-25T20:43:39.148339Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.035934,
     "end_time": "2023-05-25T20:43:39.153545",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.117611",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1834"
      ],
      "text/latex": [
       "1834"
      ],
      "text/markdown": [
       "1834"
      ],
      "text/plain": [
       "[1] 1834"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "n_distinct(chipotle_df$order_id)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e36b9a28",
   "metadata": {
    "_cell_guid": "1405ea0a-8273-48ae-85a8-dcfa7496c722",
    "_uuid": "c6e60f51-d285-437f-95d2-d59815de7cb2",
    "papermill": {
     "duration": 0.011257,
     "end_time": "2023-05-25T20:43:39.175859",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.164602",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 8. What is the average revenue amount per order?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "6eadd865",
   "metadata": {
    "_cell_guid": "db67edf6-4d40-4b08-b700-38f7a3a2206c",
    "_uuid": "2136a92f-4c5f-42fc-9e7b-446cfd9b5b07",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:39.201870Z",
     "iopub.status.busy": "2023-05-25T20:43:39.200124Z",
     "iopub.status.idle": "2023-05-25T20:43:39.220118Z",
     "shell.execute_reply": "2023-05-25T20:43:39.218094Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.036188,
     "end_time": "2023-05-25T20:43:39.223231",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.187043",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7.4643357853743"
      ],
      "text/latex": [
       "7.4643357853743"
      ],
      "text/markdown": [
       "7.4643357853743"
      ],
      "text/plain": [
       "[1] 7.464336"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(chipotle_df$item_price)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a8e1fb02",
   "metadata": {
    "_cell_guid": "136fd9ad-e9a2-4ee5-be4c-cad996bb9aa2",
    "_uuid": "03e0dc11-7f71-4f3a-ba0b-2465a201bc03",
    "papermill": {
     "duration": 0.011007,
     "end_time": "2023-05-25T20:43:39.245530",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.234523",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Question 9. How many different items are sold?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "955d00b8",
   "metadata": {
    "_cell_guid": "305d216c-2c2b-432e-869f-4c986011ad1d",
    "_uuid": "8b3bc6df-3922-4dce-a456-0adbc1cbf7f8",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-05-25T20:43:39.271401Z",
     "iopub.status.busy": "2023-05-25T20:43:39.269676Z",
     "iopub.status.idle": "2023-05-25T20:43:39.325569Z",
     "shell.execute_reply": "2023-05-25T20:43:39.323581Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.071839,
     "end_time": "2023-05-25T20:43:39.328378",
     "exception": false,
     "start_time": "2023-05-25T20:43:39.256539",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>50</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " n\\\\\n",
       " <int>\\\\\n",
       "\\hline\n",
       "\t 50\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| n &lt;int&gt; |\n",
       "|---|\n",
       "| 50 |\n",
       "\n"
      ],
      "text/plain": [
       "  n \n",
       "1 50"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "count(grouped_chipotle_df)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.594209,
   "end_time": "2023-05-25T20:43:39.462400",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-05-25T20:43:32.868191",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

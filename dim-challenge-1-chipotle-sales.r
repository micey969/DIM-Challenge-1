{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "1cf1f70d",
   "metadata": {
    "papermill": {
     "duration": 0.005356,
     "end_time": "2023-05-25T20:04:47.804732",
     "exception": false,
     "start_time": "2023-05-25T20:04:47.799376",
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
   "id": "83a39214",
   "metadata": {
    "papermill": {
     "duration": 0.004165,
     "end_time": "2023-05-25T20:04:47.813301",
     "exception": false,
     "start_time": "2023-05-25T20:04:47.809136",
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
   "id": "f1220107",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:47.825543Z",
     "iopub.status.busy": "2023-05-25T20:04:47.823789Z",
     "iopub.status.idle": "2023-05-25T20:04:48.801710Z",
     "shell.execute_reply": "2023-05-25T20:04:48.800319Z"
    },
    "papermill": {
     "duration": 0.986139,
     "end_time": "2023-05-25T20:04:48.803627",
     "exception": false,
     "start_time": "2023-05-25T20:04:47.817488",
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
   "id": "5ae18ded",
   "metadata": {
    "papermill": {
     "duration": 0.004098,
     "end_time": "2023-05-25T20:04:48.812294",
     "exception": false,
     "start_time": "2023-05-25T20:04:48.808196",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Load Data\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "50702f41",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:48.846330Z",
     "iopub.status.busy": "2023-05-25T20:04:48.823373Z",
     "iopub.status.idle": "2023-05-25T20:04:49.240748Z",
     "shell.execute_reply": "2023-05-25T20:04:49.239190Z"
    },
    "papermill": {
     "duration": 0.42668,
     "end_time": "2023-05-25T20:04:49.243151",
     "exception": false,
     "start_time": "2023-05-25T20:04:48.816471",
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
   "id": "9f700a0d",
   "metadata": {
    "papermill": {
     "duration": 0.004197,
     "end_time": "2023-05-25T20:04:49.251831",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.247634",
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
   "id": "bd9869af",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.262879Z",
     "iopub.status.busy": "2023-05-25T20:04:49.261595Z",
     "iopub.status.idle": "2023-05-25T20:04:49.334479Z",
     "shell.execute_reply": "2023-05-25T20:04:49.332409Z"
    },
    "papermill": {
     "duration": 0.080643,
     "end_time": "2023-05-25T20:04:49.336666",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.256023",
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
   "id": "3e4206ee",
   "metadata": {
    "papermill": {
     "duration": 0.005003,
     "end_time": "2023-05-25T20:04:49.346824",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.341821",
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
   "id": "132212a5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.360260Z",
     "iopub.status.busy": "2023-05-25T20:04:49.358891Z",
     "iopub.status.idle": "2023-05-25T20:04:49.402727Z",
     "shell.execute_reply": "2023-05-25T20:04:49.401436Z"
    },
    "papermill": {
     "duration": 0.05301,
     "end_time": "2023-05-25T20:04:49.404667",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.351657",
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
    "head(grouped_chipotle_df,1)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "37440e4d",
   "metadata": {
    "papermill": {
     "duration": 0.005213,
     "end_time": "2023-05-25T20:04:49.415442",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.410229",
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
   "id": "51c54c2a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.428890Z",
     "iopub.status.busy": "2023-05-25T20:04:49.427590Z",
     "iopub.status.idle": "2023-05-25T20:04:49.440935Z",
     "shell.execute_reply": "2023-05-25T20:04:49.439636Z"
    },
    "papermill": {
     "duration": 0.022026,
     "end_time": "2023-05-25T20:04:49.442667",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.420641",
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
   "id": "fa0e7747",
   "metadata": {
    "papermill": {
     "duration": 0.005623,
     "end_time": "2023-05-25T20:04:49.453817",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.448194",
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
   "id": "af315cf8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.468672Z",
     "iopub.status.busy": "2023-05-25T20:04:49.467351Z",
     "iopub.status.idle": "2023-05-25T20:04:49.509777Z",
     "shell.execute_reply": "2023-05-25T20:04:49.508066Z"
    },
    "papermill": {
     "duration": 0.052186,
     "end_time": "2023-05-25T20:04:49.512080",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.459894",
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
   "id": "165c8a22",
   "metadata": {
    "papermill": {
     "duration": 0.005714,
     "end_time": "2023-05-25T20:04:49.523598",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.517884",
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
   "id": "132566e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.538244Z",
     "iopub.status.busy": "2023-05-25T20:04:49.537020Z",
     "iopub.status.idle": "2023-05-25T20:04:49.574381Z",
     "shell.execute_reply": "2023-05-25T20:04:49.551519Z"
    },
    "papermill": {
     "duration": 0.047423,
     "end_time": "2023-05-25T20:04:49.576889",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.529466",
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
   "id": "5287a889",
   "metadata": {
    "papermill": {
     "duration": 0.00595,
     "end_time": "2023-05-25T20:04:49.588687",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.582737",
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
   "id": "878c1427",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.602859Z",
     "iopub.status.busy": "2023-05-25T20:04:49.601703Z",
     "iopub.status.idle": "2023-05-25T20:04:49.628976Z",
     "shell.execute_reply": "2023-05-25T20:04:49.627127Z"
    },
    "papermill": {
     "duration": 0.036826,
     "end_time": "2023-05-25T20:04:49.631251",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.594425",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>order_id</th><th scope=col>quantity</th><th scope=col>item_name</th><th scope=col>choice_description</th><th scope=col>item_price</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>Chips and Fresh Tomato Salsa         </td><td>NA                                                                         </td><td> 2.39</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>Izze                                 </td><td>[Clementine]                                                               </td><td> 3.39</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>1</td><td>Nantucket Nectar                     </td><td>[Apple]                                                                    </td><td> 3.39</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td>Chips and Tomatillo-Green Chili Salsa</td><td>NA                                                                         </td><td> 2.39</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2</td><td>2</td><td>Chicken Bowl                         </td><td>[Tomatillo-Red Chili Salsa (Hot), [Black Beans, Rice, Cheese, Sour Cream]] </td><td>16.98</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>3</td><td>1</td><td>Chicken Bowl                         </td><td>[Fresh Tomato Salsa (Mild), [Rice, Cheese, Sour Cream, Guacamole, Lettuce]]</td><td>10.98</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & order\\_id & quantity & item\\_name & choice\\_description & item\\_price\\\\\n",
       "  & <int> & <int> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 1 & Chips and Fresh Tomato Salsa          & NA                                                                          &  2.39\\\\\n",
       "\t2 & 1 & 1 & Izze                                  & {[}Clementine{]}                                                                &  3.39\\\\\n",
       "\t3 & 1 & 1 & Nantucket Nectar                      & {[}Apple{]}                                                                     &  3.39\\\\\n",
       "\t4 & 1 & 1 & Chips and Tomatillo-Green Chili Salsa & NA                                                                          &  2.39\\\\\n",
       "\t5 & 2 & 2 & Chicken Bowl                          & {[}Tomatillo-Red Chili Salsa (Hot), {[}Black Beans, Rice, Cheese, Sour Cream{]}{]}  & 16.98\\\\\n",
       "\t6 & 3 & 1 & Chicken Bowl                          & {[}Fresh Tomato Salsa (Mild), {[}Rice, Cheese, Sour Cream, Guacamole, Lettuce{]}{]} & 10.98\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | order_id &lt;int&gt; | quantity &lt;int&gt; | item_name &lt;chr&gt; | choice_description &lt;chr&gt; | item_price &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1 | 1 | Chips and Fresh Tomato Salsa          | NA                                                                          |  2.39 |\n",
       "| 2 | 1 | 1 | Izze                                  | [Clementine]                                                                |  3.39 |\n",
       "| 3 | 1 | 1 | Nantucket Nectar                      | [Apple]                                                                     |  3.39 |\n",
       "| 4 | 1 | 1 | Chips and Tomatillo-Green Chili Salsa | NA                                                                          |  2.39 |\n",
       "| 5 | 2 | 2 | Chicken Bowl                          | [Tomatillo-Red Chili Salsa (Hot), [Black Beans, Rice, Cheese, Sour Cream]]  | 16.98 |\n",
       "| 6 | 3 | 1 | Chicken Bowl                          | [Fresh Tomato Salsa (Mild), [Rice, Cheese, Sour Cream, Guacamole, Lettuce]] | 10.98 |\n",
       "\n"
      ],
      "text/plain": [
       "  order_id quantity item_name                            \n",
       "1 1        1        Chips and Fresh Tomato Salsa         \n",
       "2 1        1        Izze                                 \n",
       "3 1        1        Nantucket Nectar                     \n",
       "4 1        1        Chips and Tomatillo-Green Chili Salsa\n",
       "5 2        2        Chicken Bowl                         \n",
       "6 3        1        Chicken Bowl                         \n",
       "  choice_description                                                         \n",
       "1 NA                                                                         \n",
       "2 [Clementine]                                                               \n",
       "3 [Apple]                                                                    \n",
       "4 NA                                                                         \n",
       "5 [Tomatillo-Red Chili Salsa (Hot), [Black Beans, Rice, Cheese, Sour Cream]] \n",
       "6 [Fresh Tomato Salsa (Mild), [Rice, Cheese, Sour Cream, Guacamole, Lettuce]]\n",
       "  item_price\n",
       "1  2.39     \n",
       "2  3.39     \n",
       "3  3.39     \n",
       "4  2.39     \n",
       "5 16.98     \n",
       "6 10.98     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#omit the dollar sign then convert item price to float\n",
    "chipotle_df$item_price <- as.numeric(gsub('[$,]','', chipotle_df$item_price))\n",
    "head(chipotle_df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9c86686a",
   "metadata": {
    "papermill": {
     "duration": 0.006081,
     "end_time": "2023-05-25T20:04:49.643421",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.637340",
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
   "id": "ca6738d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.658736Z",
     "iopub.status.busy": "2023-05-25T20:04:49.657532Z",
     "iopub.status.idle": "2023-05-25T20:04:49.672750Z",
     "shell.execute_reply": "2023-05-25T20:04:49.670929Z"
    },
    "papermill": {
     "duration": 0.025536,
     "end_time": "2023-05-25T20:04:49.675190",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.649654",
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
   "id": "83d2bc3c",
   "metadata": {
    "papermill": {
     "duration": 0.006194,
     "end_time": "2023-05-25T20:04:49.687593",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.681399",
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
   "id": "cae5311c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.702843Z",
     "iopub.status.busy": "2023-05-25T20:04:49.701688Z",
     "iopub.status.idle": "2023-05-25T20:04:49.715236Z",
     "shell.execute_reply": "2023-05-25T20:04:49.713821Z"
    },
    "papermill": {
     "duration": 0.023145,
     "end_time": "2023-05-25T20:04:49.717083",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.693938",
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
   "id": "b04526e1",
   "metadata": {
    "papermill": {
     "duration": 0.006285,
     "end_time": "2023-05-25T20:04:49.729674",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.723389",
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
   "id": "5adb322d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.745836Z",
     "iopub.status.busy": "2023-05-25T20:04:49.744328Z",
     "iopub.status.idle": "2023-05-25T20:04:49.759158Z",
     "shell.execute_reply": "2023-05-25T20:04:49.757739Z"
    },
    "papermill": {
     "duration": 0.025309,
     "end_time": "2023-05-25T20:04:49.761527",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.736218",
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
   "id": "1e492688",
   "metadata": {
    "papermill": {
     "duration": 0.006459,
     "end_time": "2023-05-25T20:04:49.774619",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.768160",
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
   "id": "de8bc6fc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-25T20:04:49.790823Z",
     "iopub.status.busy": "2023-05-25T20:04:49.789629Z",
     "iopub.status.idle": "2023-05-25T20:04:49.829442Z",
     "shell.execute_reply": "2023-05-25T20:04:49.827491Z"
    },
    "papermill": {
     "duration": 0.050377,
     "end_time": "2023-05-25T20:04:49.831735",
     "exception": false,
     "start_time": "2023-05-25T20:04:49.781358",
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
   "duration": 5.135644,
   "end_time": "2023-05-25T20:04:49.957999",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-05-25T20:04:44.822355",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

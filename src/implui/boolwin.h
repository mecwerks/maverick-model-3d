/*  Maverick Model 3D
 * 
 *  Copyright (c) 2004-2007 Kevin Worcester
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
 *  USA.
 *
 *  See the COPYING file for full license text.
 */


#ifndef __BOOLWIN_H
#define __BOOLWIN_H

#include "boolwin.base.h"

#include "model.h"

#include <QtGui/QWidget>

class ViewPanel;

class BoolWin : public QWidget, public Ui::BoolWinBase
{
   Q_OBJECT

   public:
      BoolWin( Model *, ViewPanel * panel, QWidget * parent = NULL );
      virtual ~BoolWin();

      void setModel( Model * );

   public slots:
      void operationChangedEvent( bool );
      void doOperationEvent();
      void setObjectEvent();

   protected:
      void updateOperationButton();
      void clearObject();

      Model * m_model;
      ViewPanel * m_panel;
      Model::BooleanOpE m_operation;
};

#endif // __BOOLWIN_H

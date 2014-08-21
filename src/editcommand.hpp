#ifndef EDITCOMMAND_HPP
#define EDITCOMMAND_HPP

#include <QUndoCommand>
#include "treeviewmodel.hpp"

class EditCommand : public QUndoCommand
{

public:
    explicit        EditCommand(TreeViewModel *model, int index, const QString &oldName, const QVariant &oldValue, const QVariantMap &oldMetaData,
                                const QString &newName, const QVariant &newValue, const QVariantMap &newMetaData, QUndoCommand *parent = 0);
    virtual void    undo();
    virtual void    redo();

private:

    TreeViewModel*  m_model;
    int             m_index;

    QString         m_oldName;
    QVariant        m_oldValue;
    QVariantMap     m_oldMetaData;

    QString         m_newName;
    QVariant        m_newValue;
    QVariantMap     m_newMetaData;
};

#endif // EDITCOMMAND_HPP

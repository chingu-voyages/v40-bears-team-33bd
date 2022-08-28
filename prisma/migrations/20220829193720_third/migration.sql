/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" TEXT NOT NULL,
    "username" TEXT,
    "password" TEXT NOT NULL DEFAULT '',
    "wagers_done" INTEGER NOT NULL DEFAULT 0,
    "wagers_won" INTEGER NOT NULL DEFAULT 0,
    "amount_won" INTEGER NOT NULL DEFAULT 0,
    "amount_betted" INTEGER NOT NULL DEFAULT 0,
    "wagers_made" INTEGER NOT NULL DEFAULT 0,
    "api_id" TEXT DEFAULT '',
    "photo" TEXT DEFAULT '',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wager" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "description" TEXT DEFAULT '',
    "rules" TEXT DEFAULT '',
    "amount" INTEGER NOT NULL DEFAULT 0,
    "expiration_date" INTEGER NOT NULL DEFAULT 0,
    "winner_id" INTEGER NOT NULL DEFAULT 0,
    "owner_id" INTEGER NOT NULL,
    "participant_id" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Wager_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wagee" (
    "wagee_id" INTEGER NOT NULL,
    "primary_user_id" INTEGER NOT NULL,
    "agrees_winner" TEXT DEFAULT '',

    CONSTRAINT "Wagee_pkey" PRIMARY KEY ("wagee_id","primary_user_id")
);

-- CreateTable
CREATE TABLE "Invite" (
    "wager_id" INTEGER NOT NULL,
    "invitee_id" INTEGER NOT NULL,

    CONSTRAINT "Invite_pkey" PRIMARY KEY ("wager_id","invitee_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_username_key" ON "User"("email", "username");

-- AddForeignKey
ALTER TABLE "Wager" ADD CONSTRAINT "Wager_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wagee" ADD CONSTRAINT "Wagee_wagee_id_fkey" FOREIGN KEY ("wagee_id") REFERENCES "Wager"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wagee" ADD CONSTRAINT "Wagee_primary_user_id_fkey" FOREIGN KEY ("primary_user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invite" ADD CONSTRAINT "Invite_wager_id_fkey" FOREIGN KEY ("wager_id") REFERENCES "Wager"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invite" ADD CONSTRAINT "Invite_invitee_id_fkey" FOREIGN KEY ("invitee_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
